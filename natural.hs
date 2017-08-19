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

instance Show Natural where
	show x = show $ fromEnum x

-- instance Read Natural where
-- 	readsPrec x = fromInteger $ (read x) :: Integer