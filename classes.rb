class A; end
class B < A; end
class C < B; end
class D < A; end

p A.subclasses
p B.subclasses
p C.subclasses

p A.superclass
p B.superclass
p C.superclass


