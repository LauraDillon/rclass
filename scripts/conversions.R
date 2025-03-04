
fahr_to_kelvin <- function(temp_f){
  kelvin <- (temp_f - 32) * (5/9) + 273.15
  return(kelvin)
}

kelvin_to_celsius <- function(temp_k){
  celsius <- temp_k - 273.15
  return(celsius)
}

