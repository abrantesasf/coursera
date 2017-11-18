## DATES AND TIME

# Datas não têm hora, e são da calsse Date:
x <- as.Date("1970-01-01")
class(x)
x
unclass(x)

x <- as.Date("1970-01-02")
unclass(x)

x <- as.Date("1969-12-31")
unclass(x)


# Horas são armazenadas em 2 classes: POSIXct ou POSIXlt
# POSIXct = hora é representada com inteiros
# POSIXlt = hora é representada como uma lista com várias informações

x <- Sys.time()
class(x)
x
unclass(x)

p <- as.POSIXlt(x)
class(p)
p
unclass(p)
names(unclass(p))


# Conversão em datas: strptime() converte em POSIXlt
d <- strptime("January 10, 2012 10:40", "%B %d, %Y %H:%M")
d
class(d)

