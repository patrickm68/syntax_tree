# frozen_string_literal: true

require "etc"
require "json"
require "pp"
require "prettier_print"
require "ripper"
require "stringio"

require_relative "syntax_tree/formatter"
require_relative "syntax_tree/node"
require_relative "syntax_tree/parser"
require_relative "syntax_tree/version"

require_relative "syntax_tree/basic_visitor"
require_relative "syntax_tree/visitor"
require_relative "syntax_tree/visitor/field_visitor"
require_relative "syntax_tree/visitor/json_visitor"
require_relative "syntax_tree/visitor/match_visitor"
require_relative "syntax_tree/visitor/pretty_print_visitor"

# Syntax Tree is a suite of tools built on top of the internal CRuby parser. It
# provides the ability to generate a syntax tree from source, as well as the
# tools necessary to inspect and manipulate that syntax tree. It can be used to
# build formatters, linters, language servers, and more.
module SyntaxTree
  # This holds references to objects that respond to both #parse and #format
  # so that we can use them in the CLI.
  HANDLERS = {}
  HANDLERS.default = SyntaxTree

  # This is a hook provided so that plugins can register themselves as the
  # handler for a particular file type.
  def self.register_handler(extension, handler)
    HANDLERS[extension] = handler
  end

  # Parses the given source and returns the syntax tree.
  def self.parse(source)
    parser = Parser.new(source)
    response = parser.parse
    response unless parser.error?
  end

  # Parses the given source and returns the formatted source.
  def self.format(source, maxwidth = 80)
    formatter = Formatter.new(source, [], maxwidth)
    parse(source).format(formatter)

    formatter.flush
    formatter.output.join
  end

  # Returns the source from the given filepath taking into account any potential
  # magic encoding comments.
  def self.read(filepath)
    encoding =
      File.open(filepath, "r") do |file|
        break Encoding.default_external if file.eof?

        header = file.readline
        header += file.readline if !file.eof? && header.start_with?("#!")
        Ripper.new(header).tap(&:parse).encoding
      end

    File.read(filepath, encoding: encoding)
  end
end
