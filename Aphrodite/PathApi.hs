module PathApi where

import Data.Aeson
import Data.Text
import Control.Applicative
import Control.Monad
import GHC.Generics 

directionsUrl :: String -> String -> IO C.ByteString
directionsUrl orig dest = "https://maps.googleapis.com/maps/api/directions/json?"
			++ "Directions"
			++ "&key=" ++ googleAPIKey
			++ "origin=" ++ urlEncode orig
			++ "&destination=" ++ urlEncode dest
			++ "&mode=transit"			--makes default mode of transportation 'transit'

directionsUrlMode :: String -> String -> String -> IO C.ByteString
directionsUrlMode orig dest mode = "https://maps.googleapis.com/maps/api/directions/json?"
			++ "Directions"
			++ "&key=" ++ googleAPIKey
			++ "origin=" ++ urlEncode orig
			++ "&destination=" ++ urlEncode dest
			++ "&mode=" ++ mode        --mode of transportation is whatever is handed in. ie: driving, walking, bicycling.


getRouteFromStr :: Maybe [String] -> Maybe [String] -> IO C.ByteString
getRouteFromStr (Just [lat1,lng1]) (Just [lat2,lng2]) = do res <- simpleHttp $ directionsURL geoStr1 geoStr2
	where geoStr1 = lat1 ++ "," ++ lng1
	      geoStr2 = lat2 ++ "," ++ lng2




