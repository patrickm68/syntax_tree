%
next
%
next foo
%
next foo, bar
%
next(foo)
%
next fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
-
next(
  fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
)
%
next(fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo)
-
next(
  fooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
)
%
next (foo), bar
%
next(
  foo
  bar
)
%
next(1)
-
next 1
%
next(1.0)
-
next 1.0
%
next($a)
-
next $a
%
next(@@a)
-
next @@a
%
next(self)
-
next self
%
next(@a)
-
next @a
%
next(A)
-
next A
%
next([])
-
next []
%
next([1])
-
next [1]
%
next([1, 2])
-
next 1, 2
%
next fun foo do end
-
next(
  fun foo do
  end
)
%
next :foo => "bar"
