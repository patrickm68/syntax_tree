%
if foo
  bar
elsif baz
end
%
if foo
  bar
elsif baz
  qux
end
%
if foo
  bar
elsif baz
  qux
else
  qyz
end
%
if true
elsif false # comment1
  # comment2
end
