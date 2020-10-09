
int unsigned会被转换成 int64
double(10,2) 需要用double
decimal(16,2)被转换成string,但是可以用--map-column-java "credit=Double"转换成double