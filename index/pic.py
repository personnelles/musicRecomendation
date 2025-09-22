import enum


class MyType(type):

    def __new__(cls, name, bases, attrs):
        new_cls = super().__new__(cls, name, bases, attrs)

        print(cls.__init__ is type.__init__)
        return new_cls


class A(int, metaclass=MyType):
    def __init__(self):
        pass


print(A.__init__)
