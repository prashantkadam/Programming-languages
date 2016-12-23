--assignment4.hs
-------------------------------------------------------------------------------------------
getindex n [] = error "No element found"
getindex n (x:xs)
	| n==x = 1
	| otherwise = 1 + getindex n xs

--Question 1  ---   slice i j lt

------------------------------------------------------------------------------------
slice i j lt = [x | x<-lt , getindex x lt >=i, getindex x lt <=j]
------------------------------------------------------------------------------------


--Question 2  --- delete k lt
------------------------------------------------------------------------------------
delete k lt = [x | x <-lt ,mod (getindex x lt) k /= 0]
------------------------------------------------------------------------------------

--Question 3  --- occurs x bt 
--Node Tree Int Tree
------------------------------------------------------------------------------------
data Tree = Leaf Int | Node Tree Int Tree
occurs :: Int -> Tree -> Bool
occurs x (Leaf y)
	| x==y = True
	| otherwise = False
occurs x (Node tr1 n tr2)
	| x==n = True
	| otherwise =(occurs x tr1) || (occurs x tr2)
------------------------------------------------------------------------------------

--Question 4  --- sortlist lt

---------------------------------------------------------------------------------------------
minimumInList :: [[Int]] -> [Int]
minimumInList [x] = x
minimumInList (x:y:ys) 
	| length x <= length y =	minimumInList (x:ys)
	| otherwise = minimumInList (y:ys)

deletefirst :: [Int] -> [[Int]] ->[[Int]]
deletefirst n [] = []
deletefirst n (x:xs) 
		| n==x =  (xs)
		| otherwise = x : deletefirst n xs

sortlist :: [[Int]] -> [[Int]]
sortlist [x] = [x]
sortlist (x:y:ys) = minimumInList(x:y:ys):sortlist (deletefirst (minimumInList(x:y:ys)) (x:y:ys))
-------------------------------------------------------------------------------------------------

--Question 5  --- flatten lt
-------------------------------------------------------------------------------------------------
flatten lt = [x | sub <- lt, x <- sub]
-------------------------------------------------------------------------------------------------