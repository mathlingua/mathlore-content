


## The Structural and Formulation Language

The Mathlingua language consists of two parts, an outer structural language and an inner 
formulation language.

Again consider the example:

```yaml
Theorem:
given: a, b
where: 'a, b is \integer'
then:
. exists: q, r
  where: 'q, r is \integer'
  suchThat:
  . '0 <= r'
  . 'r < b'
  . 'a = b*q + r
Documented:
. name:
  . "The Division Algorithm"
  . "[es]División Euclídea"
```

The structural language provides structure to the mathematical statement and uses indentation 
to connect related items and `. ` for arguments.

In the above example,

```yaml
Theorem:
given:
where:
then:
Documented:
```

is one structural unit while

```yaml
exists:
where:
suchThat:
```

is another structural unit and

```yaml
name:
```

is another structural unit.

Each structural unit is called a *group* and each part of a *group* is called a *section*.  
For example, the group `exists:where:suchThat:` has three groups, `exists:`, `where:` and 
`suchThat:`.  Notice that a `:` follows a group name which is followed by one or more arguments.

Multiple arguments can be specified on the same line, as long as they are not groups themselves, 
and are separated by commas.

For example, in `exists: q, r` the group has arguments `q` and `r`.  These arguments could 
also be specified on their own lines (preceded with `. `) either as:

```yaml
exists: q
. r
```

or

```yaml
exists:
. q
. r
```

However, if an argument to a section is a group, it must be specified on its own line.  That 
is why in:

```yaml
then:
. exists: q, r
  where: 'q, r is \integer'
  suchThat:
  . '0 <= r'
  . 'r < b'
  . 'a = b*q + r
```

The `exists:where:suchThat:` is on a new line preceded by a `. `.

Notice that the `q` and `r` in `exists: q, r` are not surrounded by single quotes while 
`where: 'q, r is \integer'` has an argument in single quotes.

Forms (such as `q`, `r`, `f(x)`, `(X, *)`, `{(x, y) | ...}`) can be specified in the structural 
language in sections that introduce names (such as `exists:`, `forAll:`, `given:` etc.) and 
they introduce a name as well as the shape of that name.

For example, `q` specifies a single opaque entity, `f(x)` represents a function-like object 
with `x` representing the input, `(X, *)` representing a tuple like object, and `{(x, y) | ...}` 
a set like object of tuples.

Because the structural language specifies the form of names introduced, operators like `*` in 
`(X, *)` can be specified and are treated as names, not as an operation acting on inputs 
(such as `1 * 2`).

Text in single quotes, on the other hand, such as `'q, r is \integer'` is written using the 
formulation language that describes computations and statements.

That is, `q, r is \integer` is a statement that `q` and `r` are integers (The `is` keyword 
will be discussed in more detail later).

In the formulation language any sequence of characters (with some caveats discussed later) 
from:

```
~ ! @ # $ % ^ & * - _ + = | / < >
```

are treated as operators.  Thus `1 + 2` is interpreted as an operator `+` with arguments `1` 
and `2`.  Similarly, `1 @& 2` is interpreted as an operator `@&` with the same arguments.

*Stropping* is used to represent an operator itself.  That is, `"+"` (note the double quotes) 
represents the name of the operator `+` itself.

Thus, the structural language describes the structure of a piece of mathematical knowledge 
while the formulation language describes computations and statements.

Last, notice the section:

```yaml
Documented:
. name:
  . "The Division Algorithm"
  . "[es]División Euclídea"
```

with arguments in double quotes, `"The Division Algorithm"` and `"[es]División Euclídea"`.

Text in double quotes are text-items, and represent textual information.  This text is UTF-8 
encoded and by default is interpreted as English.

If the text is in another language, the text can start with an ISO 639-1 language code in a 
square braces to specify the language.

For example in `"[es]División Euclídea"` the `[es]` specifies that the text is in Spanish.

### The Formulation Language

#### Forms

##### Identifiers
      * Describe that underscores can be used
      * Describe stropping is done with ""
      * Describe that backtick is used for quote
##### Tuples
      * Describe that `(x)` and `x` are equivalent and
        `f((x,y,z))` and
        `f(x, y, z)` are equivalent
##### Conditional sets
      * Describe variadic args
##### Mappings
      * Describe how `f(x)` means the structure in structural view
        and value otherwise
      * Describe variadic args

    * Describe how ordinal calls can be used `x{i}` and `f(x){i}`.
    * Details
      * Forms can be nested
      * Forms describe structure

#### Commands
    * Examples
    * Usage
    * Directed `@[]`
    * Variadic
    * Signatures
      * Only allows for overloading in directions but whenever any
        part of the command is variadic, the whole this is treated 
        as variadic and there can only be one variadic form
    * Describe how `[]{}` and `[]{:}` is sugar for mapping and
      conditional set inputs
  * `is`, `as`, `extends`
    * just a brief intro
  * `:=`
    * Describe how identifiers can only be set once
  * `=`
    * Describe that it is built-in but has no meaning
  * `:=>`
    * Describe it is used for aliases that match the type of the
      input
  * `:->`
    * Describe it is used for is-like forms and the rules around
      it
      
#### Commands

Commands are of the form `\(name.)*name([]?{}(@name[])?)?(:name[]?{}(@name[])?)*(())?`.  For 
example, the following are valid:

```
\abc
\f{x}
\some.name:abc{x, y}:xyz{a, b}
\some.name{1, 2}:abc{x, y}:xyz{a, b}
\some.name{1, 2}:abc{x, y}:xyz{a, b}(a, b)
```

In particular, if a `{}` accepts exactly one argument, and that argument is a mapping or 
conditional set, then the `{}` can be suffixed with `@name[vars]` where `name` is optional 
and can be any name and `vars` is one or more vars from the mapping or conditional set:

```
\int[x, y]{x^2 + y^2}@d[x]
\int[x, y]{x^2 + y^2}@d[x, y]
\int[x, y]{x^2 + y^2}@d[y, x]
\something[x,y]{x | x > y}@[x]
\something[u(x), v(x)]{u(x)^2 + v(x)^2}@[u(x)]
\some[x]{x}@[x]
```

If a command is of the form `\sin(x)`, for example, (and thus has a form `f(x)`), then
`\sin` is valid an refers to `f`.

#### Literals

Mathlingua supports the following literal forms that describe the structure of items:

```
(a, b, c)       specifies tuples
[a,b]{(a, b) | ...}  specifies a conditional set-like item
f(x, y)         specifies a mapping-like item
X               specifies a name
```

that have the corresponding literal expression forms:

```
(a, b, c)
{a, b, c}
[a,b]{(a, b) | a is \something ; a > 0}
x => x + 1
(x, y) => x + y
X
```

**Note:** Literals forms can have any other literal form for placeholder vars (for example 
params in mapping-like and conditional set-like items).  For example:

**Note:** Literal forms don't have any specifications for its parts.  For example, if a
definition is:

```yaml
[\integral[x]{f(x)}@d[x]}
Defines: F(x)
when: 'f is \continuous.function'
...
```

Then, the call `\integral[x]{x^2 + 1}` has the argument `(x) => x^2 + 1` that doesn't have
any specification of what it means.  So the check for whether `(x) => x^2 + 1` satisfies
`f is \continuous.function` is assumed to hold because the checker cannot verify it.

Thus if `integral[x]{f(x)}` is used, it must be manually verified that the `f(x)` satisfies
`f is \continuous.function`.

This is different from a definition
```yaml
[\other.integral{f(x)}]
Defines: F(x)
when: 'f is \continuous.function'
```
because then a function literal cannot be given as an argument to `\other.integral`.
Instead, one must define a `g(x)` for example,
```yaml
Theorem:
given: g(x)
where: 'g(x) is \continuous.function'
then: '\other.integral{g} = 0`
```
does do validation of whether `g is \continuous.function`.  Thus, the above definition
would check fine, but the following would be an error since `h` does not satisfy
`h is \continuous.function`:
```yaml
Theorem:
given: g(x)
where: 'g(x) is \function'
then: '\other.integral{g} = 0`
```


```
f(x, y)
f(u(x), v(x))
f({a, b, c})
f((a,b), (c,d))
[u(x), v(x)]{(u(x), v(x)) | u(x) + v(x) > x}
```

However, a single tuple `(x)` is the same as `x`.  As such, `f((a, b))` is the same as `f(a, b)`.

**Note:** Command arguments in curly parens support a short form for literals:

That is:

```
\some.command[x,y]{x^2 + y^2}
```

is equivalent to:

```
\some.command{(x, y) => x^2 + y^2}
```

and

```
\some.command[x,y]{(x, y) | x > 0 ; y > 0}
```

is equivalent to:

```
\some.command{[x,y]{(x, y) | x > 0 ; y > 0}}
```

**Note:** If a literal is supplied to a command, the `when:` section specifies what is 
*assumed* holds for the literal instead of verifying the input.

#### Variable Shadowing

Variables cannot shadow other variables within an entity except in one instance: Placeholder 
variables can be shadowed as a non-placeholder variable.

For example,

```
[\bounded.function:by{M}]
Defines: f(x)
...
satisfies:
. forAll: x
  then: 'f(x) <= M'
```

On the `Defines:` line the `x` is a placeholder var and the `x` on the `forAll` line is a 
non-placeholder var.


#### Operators
* Order of operations
* General prefix, postfix, infix
* Enclosed (`[G.*]` and `[\[a.b.c].*]`)
* `:` for resolution

#### Built in types
* `[:statement:]`, `[:spec:]`, `[:value:]`, `[:kind:]`
* `[:statement|spec|value|kind:]`

####  Specs vs clauses

### The Structural Language
* Guiding principles
  * Structural language is fixed and formulation language is fluid
  * Indentation based with dot space for arguments

####  Building blocks:

```
not:  Clause
```


```
allOf:  Clause+
```


```
anyOf:  Clause+
```


```
oneOf:  Clause+
```


```
exists:    Target+
where?:    Spec+
suchThat:  Clause+
```


```
existsUnique:  Target+
where?:        Spec+
suchThat:      Clause+
```


```
forAll:     Target+
where?:     Spec+
suchThat?:  Clause+
then:       Clause+
```


```
if:    Clause+
then:  Clause+
```


```
iff:   Clause+
then:  Clause+
```


```
piecewise:
(if:         Clause+
 then:       Clause+)+
else?:       Clause+
```


```
when:  Spec+
then:  Clause+
```


```
given:      Target+
where?:     Spec+
suchThat?:  Clause+
then:       Clause+
```


#### Common aspects
* `[ids]`
  * MetaIds
  * Documented
    * describe each item
  * References
    * brief overview with reference to the References section
  * Aliases
  * Justification

##### Labels

Labels can contain any text, `\[some.signature]` or `\[some.operator]/` specifies an entire 
definition or result and `\[some.signature]::(some.label)` or `\[some.operator]/::(some.label)` 
refers to a label inside of a definition or result.  The form `\(some.label)` refers to a label
within an entity.  That is within the entity, `\[some.entity]`, the label `\(some.label)`
is the same as `\[some.entity]::(some.label)`.

##### Aliases Items

An alias is used to provide a shortened way to describe an operation.  For example, 
`a * b :=> a \real.*/ b` specifies that `*` represents real multiplication.  The type `:->`
cannot be used as an alias item.

```
alias:       Alias
written?:    Text
```

###### Provides Items

Provides items are used to describe the operations or members provided by a defined entity.  
For example, items in a group provide a `*` operation and provides an `e` member that represents 
the identity of the group.

```
symbol:    Alias
written?:  Text
```

```
connection:
to:          Target
using?:      Target+
means:       Spec
signifies?:  Spec
viewable?:
through?:    Expression
```


###### Documented Items

Documented items are used to document parts of a mathematical entity such as how it is 
written in text or spoken aloud, a overview of the item, and informal description, its 
history, etc.

```
written:  Text
```

```
called:  Text
```

```
writing:  Target
as:       Text
```

```
overview:  Text
```

```
motivation:  Text
```

```
history:  Text
```

```
example:  Text+
```

```
related:  Text+
```

```
discoverer:  Author+
```

```
note:  (Text|describing:)+
```


```
describing:  Text
content:     Text
```


###### References Items

References are used in items to specify the justification for different labeled parts 
of the item.

```
label:    Text
by:       Text|Signature
comment:  Text
```

```
by:       Text|Signature
comment:  Text
```

###### Metadata Items

```
id:  Text
```

#### Definitions
##### Declares
      * Describe this is like abstract type
      * Describe how to assign symbols
      * Describe how to assign connections
##### Defines
      * Describe this is like concrete type
      * Describe how to assign symbols
      * Describe how to assign connections
      * Describe `generalizes:`

##### Definitions

A `Describes:` item is used to define an abstract mathematical entity.

```
[\...]
Describes:    Target
with?:        Target+
using?:       Target+
when?:        Spec+
suchThat?:    Clause+
extends?:     Spec+
satisfies?:   Clause+
Provides?:    ProvidedItem+
Justified?:   JustifiedItem+
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```

A `Defines:` item is used to define a concrete mathematical entity.


```
[\...]
Defines:      Target
with?:        Target+
using?:       Target+
when?:        Spec+
suchThat?:    Clause+
generalizes?: Formulation[Signature]+
means?:       Spec
specifies:    Clause+
Provides?:    ProvidesItem+
Justified?:   JustifiedItem+
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```

A `States:` item is used to describe the relationship between two mathematical entities.

```
[\...]
States:
with?:        Target+
using?:       Target+
when?:        Spec+
suchThat?:    Clause+
that?:        Spec+
satisfies?:   Clause+
Documented?:  DocumentedItem+
Justified?:   JustifiedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```


#### Results

An `Axiom:` item describes a mathematical result that assumed to be true.

```
[\...]?
Axiom:
given?:       Target+
where?:       Spec+
if|iff?:      Clause+
then:         Clause+
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```

A `Conjecture:` item is used to describe a mathematical result that is thought to be true 
but no proof of the result exists.

```
[\...]?
Conjecture:
given?:       Target+
where?:       Spec+
if|iff?:      Clause+
then:         Clause+
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```

A `Theorem:` item is used to describe a mathematical result that has a proof.

```
[\...]?
Theorem:
given?:       Target+
where?:       Spec+
if|iff?:      Clause+
then:         Clause+
Proof?:       (Proof:|Text)
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```

A `Proof:` item is used to describe a proof for a mathematical theorem.

```
[\...]?
Proof:
of:           Text
content:      Text
References?:  ReferencesItem+
Metadata?:    MetadataItem+
```


An item that specifies the proof of a theorem.

> THIS WAS DUPLICATED: DETERMINE WHICH ONE IS CORRECT <

```
[\...]
Proof:
of: TextItem
content: TextItem
References?:  ReferencesItem+
```

A `Corollary:` item is used to describe a mathematical result that has a proof and
is a follow-up to a theorem:

```
[\...]?
Corollary:
to:           Text+
given?:       Target+
where?:       Spec+
if|iff?:      Clause+
then:         Clause+
Proof?:       (Proof:|Text)
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```

A `Lemma:` item is used to describe a mathematical result that has a proof and
is a result that will be used to prove a theorem:

```
[\...]?
Lemma:
for:          Text+
given?:       Target+
where?:       Spec+
if|iff?:      Clause+
then:         Clause+
Proof?:       (Proof:|Text)
Documented?:  DocumentedItem+
References?:  ReferencesItem+
Aliases?:     AliasesItem+
Metadata?:    MetadataItem+
```


#### Resources

A resource is used to describe a book, article, website, etc.

```
[$...]
Resource: ResourceItem+
```


##### Resource Items

```
title: Text
```

```
author: Person+
```

```
offset: Text
```

```
url: Text
```

```
homepage:  Text
```

```
type: Text
```

```
edition:  Text
```

```
editor:  Text+
```

```
institution:  Text+
```

```
journal:  Text+
```

```
publisher: Text+
```

```
volume:  Text
```

```
month:  Text
```

```
year:  Text
```

```
description:  Text
```


#### Specify

A specify item is used to describe how number literal should be viewed.  For example `2` 
is an integer and `2.5` is a real number.

```
Specify:  SpecifyItem+
```

##### Specify Items

```
positive:
int:
is:        Signature
```

```
negative:
int:
is:        Signature
```

```
zero:
is:    Signature
```

```
positive:
decimal:
is:        Signature
```

```
negative:
decimal:
is:        Signature
```


#### Person

A person item is used to describe a person such as an author.

```
[@...]
Person:
. name: Text+
. biography: Text
```

#### Topic

A topic is used to describe the general area of mathematics such as Real Analysis.

```
[#...]
Topic:
content:      Text
References?:  ReferencesItem+
Metadata?:    MetadataItem+
```

## `where:` vs `suchThat:`
* A `where:` or `when:` section can only contain `is`, `extends`, or `... [op]: ...`
  where `[op]` is a `:->`
* A `suchThat` can contain `:=`, `=`, or any other operators
* Note: This means a `:=` or `=` cannot be used in a `where:` or `when:`.

## Rendering Mathlingua Documents
* Describe how functions, tuples, etc. are rendered
* Describe how `called:`, `written:`, and `writing:` are used
* Describe purpose of separating description with rendering
* Pretty printing
  * Describe how alpha, beta, etc. are automatically rendered as greek letters
  * Describe how `a_1` and `a1` are valid identifiers and they are rendered the same

## The Type System
* Flow based typing with something similar to intersection types
* Describe how `is` works and how types are a collection of  
  signatures
* Describe how `extends` works
* Describe how every name must share a common ancestor type
* Describe how `f(x)`, `f`, and `x` are all different names
* Describe relation to simple type theory

## Symbol Resolution
* Describe how operators and commands are resolved
* Describe how `:->` is used during spec resolution
* Describe how names are resolved (looking in local scope, then global, and then 
  `Specify:`)

## Checking Mathlingua Documents
* Guiding principles
  * Describe the cost/benefit tradeoff justifying why the checker is design the
    way it is
* Items that are checked
  * *todo list them all here*
* Items that are not checked

## Multiplexing
* An enclosed operator can have multiple arguments on the side not containing
  a colon, but only one argument on the side with a colon.
* In an enclosed operator doesn't have a colon, then both the left-hand-side and
  right-hand-side can have only one argument.
* An `is` or `extends` can have one or more arguments on the left-hand-side, but
  only one on the right-hand-size.

