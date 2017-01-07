import Control.Applicative
import Control.Monad
import System.IO

main :: IO()
main = do
     n_temp <- getLine
     let n =read n_temp ::Int
     a_temp <- getMultipleLines n
     let a = map ( map (read::String->Int) . words) a_temp
     let b1 = sum [a!!i!!j | i <-[0..2] ,j <-[0..2],i==j]
     let b2 = sum [a!!i!!j | i<-[0..2],j<-[0..2],i+j==2]
     let rs = abs(b1-b2)
     print rs

getMultipleLines :: Int -> IO[String]

getMultipleLines n
   | n<=0 = return []
   | otherwise = do
              x <- getLine
              xs <- getMultipleLines (n-1)
              let ret = (x:xs)
              return ret