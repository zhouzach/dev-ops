
Returns the first non-null value in the argument list. Like a CASE expression, arguments are only evaluated 
if necessary.
COALESCE(getmoney,0)




nullif(value1, value2)
Returns null if value1 equals value2, otherwise returns value1.


try(expression)
Evaluate an expression and handle certain types of errors by returning NULL.
In cases where it is preferable that queries produce NULL or default values instead of failing when corrupt or invalid data is encountered, the TRY function may be useful. To specify default values, the TRY function can be used in conjunction with the COALESCE function.
The following errors are handled by TRY:
Division by zero
Invalid cast or function argument
Numeric value out of range