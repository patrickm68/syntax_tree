%
foo bar
%
foo barrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr, bazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
-
foo barrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr,
    bazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
%
meta1 def foo
end
%
meta2 meta1 def foo
end
%
meta3 meta2 meta1 def foo
end
%
meta1 def self.foo
end
%
meta2 meta1 def self.foo
end
%
meta3 meta2 meta1 def self.foo
end
%
foo bar {}
%
foo bar do
end
