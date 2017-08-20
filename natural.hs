module Natural where

fstAdd :: Integral a => (a, t) -> a -> (a, t)
fstAdd (a, b) x = (a + x, b)

data Natural = Zero | Succ Natural
    deriving (Eq, Ord)

instance Enum Natural where
    pred Zero = undefined
    pred (Succ x) = x

    succ x = Succ x

    toEnum 0 = Zero
    toEnum x = Succ (toEnum (x - 1))

    fromEnum Zero = 0
    fromEnum (Succ x) = fromEnum x + 1

instance Num Natural where
    (+) x Zero = x
    (+) x (Succ y) = Succ (x + y)

    (-) Zero (Succ x) = undefined
    (-) x Zero = x
    (-) (Succ x) (Succ y) = x - y

    (*) x Zero = Zero
    (*) x (Succ y) = x * y + x

    abs x = x

    signum Zero = Zero
    signum (Succ x) = Succ Zero

    fromInteger 0 = Zero
    fromInteger x = Succ (fromInteger (x - 1))

instance Real Natural where
    toRational Zero = 0
    toRational (Succ x) = toRational x + 1

instance Integral Natural where
    toInteger Zero = 0
    toInteger (Succ x) = toInteger x + 1

    quotRem x Zero = undefined
    quotRem Zero x = (Zero, Zero)
    quotRem x (Succ Zero) = (x, Zero)
    quotRem (Succ Zero) x = (Zero, Succ Zero)
    quotRem x y = if x >= y then fstAdd (quotRem (x - y) y) 1 else (Zero, x)

instance Show Natural where
    --showsPrec p n = [(fromEnum i, s') | (i, s') <- showsPrec p s]
    show x = show $ toInteger x

instance Read Natural where
    readsPrec p s = [(fromInteger i, s') | (i, s') <- readsPrec p s]