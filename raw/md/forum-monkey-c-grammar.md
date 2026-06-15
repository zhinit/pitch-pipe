# Forum: Monkey-C Grammar Questions

Source: https://forums.garmin.com/developer/connect-iq/f/discussion/195/monkey-c-grammar-questions

## Original Questions (tonny.madsen)

Seven key language feature questions:

1. **Object Context Reference**: Asked if `this`, `self`, or similar exists to
   reference the current object without creating redundant variables.

2. **Object Instantiation Syntax**: `var x = new {};` fails despite
   documentation suggesting it should work, though `var x = {};` succeeds.

3. **Static Keyword Purpose**: Questioned the meaning of `static` when applied
   to class and enum declarations.

4. **Type Checking Classes**: `C has :function` fails on classes but works on
   instances, requiring instantiation to test method presence.

5. **Ternary Operator**: The `expr?expr:expr` construct works but lacks
   documentation.

6. **L-value Assignment**: `f().a = 0;` fails even though function return
   values could logically be assignable.

7. **Expression Statements**: `a+2;` as a statement fails, but `(a+2);`
   succeeds.

## Official Response (AlphaMonkeyC)

Key clarifications:

- **Self/Me Keywords**: Both `self` and `me` refer to `this`. `me` is a
  holdover and might be removed.

- **Numeric Types**: Number/Float are signed 32-bit; Long/Double are signed
  64-bit.

- **Static Variables**: Function as "scoped modules" accessible to all class
  members.

- **Statement Grammar**: "Statements usually don't allow expressions" without
  assignment or method invocation.

The developer acknowledged ongoing grammar refinements and planned future BNF
publication.
