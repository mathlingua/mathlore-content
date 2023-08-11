	
# Mathlingua: The Official Guide

## Introduction

Today there is so much mathematical knowledge in existence in the form of 
definitions, axioms, theorems, and conjectures, that it can be hard to know 
or discover what is known and what is unknown.

Suppose you want to find all theorems that describe Cauchy sequences or all 
definitions of functions that have a specific property.  It is very difficult 
to answer such questions with traditional journals, books, encyclopedias, and 
other sources.

Mathlingua is a language designed to precisely describe mathematical knowledge 
in such a way that a knowledgebase encoded in MathLingua is easy for people and 
computers to read, write, and understand the meaning of the mathematical 
statement described.

That is, typically encyclopedias, books, and journals record mathematics using 
natural languages such that it is extremely difficult, if not impossible, for a 
computer to understand the meaning of the mathematics described in the encyclopedia.

That is, one can search for the definition of a group in current enclyclopedias, 
journals, and books etc.  However, one cannot easily search for all definitions of 
mathematical constructs that extend the idea of a group to include more requirements.

The purpose of MathLingua is to build an encyclopedia of mathematics specifically 
designed to record mathematics in such a way that computers can understand the 
meaning of the mathematics recorded to be able to answer such questions.

## An Example

To get a feel for the MathLingua language, consider the following theorem:

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
```

It states that given two integers `a` and `b` then there exists integers `q` and `r` 
with `0 <= r < b` such that `a = b*q + r`.

Notice that MathLingua uses indendation to describe the structure of a piece of 
mathematical knowledge with elements at the same indentation consisting of a single 
unit.

That is, in the example above, `Theorem:given:where:then:` constitutes one unit and 
`exists:where:suchThat:` constitues another unit.  The first describes the overal 
structure of the theorem while the second describes the structure of statement of the 
existence of a particular mathematical entity with some properties.

These text elements are part of MathLingua's structural sublanguage that describes the 
structure of the theorem. The text in single quotes, on the other hand, is written in 
MathLingua's formulation sublanguage and describes the details of the theorem.

Next notice that if the theorem is read out loud, left to right, from top to bottom, 
it sounds very similar to how the theorem could be written in english in a textbook.

MathLingua is designed to have the same level of formality as, and a similar read to, 
the way mathematics is described in textbooks while have a structure that allows the 
content to be discoverable.

The goal of MathLingua is that anyone that can read and understand mathematical 
definitions, theorems, axioms, and conjectures can easily learn to read mathematical 
knowledge written in MathLingua.  However, compared to mathematical knowledge written 
in natural languages like english, MathLingua provides consistency, conciseness, and 
precision.

## Relationship to Other Mathematical Languages

MathLingua is distinct from representational languages like LaTeX or MathML, transfer 
languages like OMDoc, evaluative technologies like Sage, MatLab, and Mathematica and 
proof languages/theorem proving technologies like Coq, Lean, etc.

Representational languages are used to describe what mathematical statements look like 
when rendered on a screen or printed on a piece of paper but do not describe the meaning 
of the statements.  MathLingua is designed to describe such meaning.

Transfer languages are used to encode mathematical knowledge in a way that can be stored 
on a hard drive or transferred between systems.  OMDoc is an example of such a language, 
but uses XML as the underlying technology and is very verbose such that it is not designed 
to be directly written by hand.  MathLingua, on the other hand, is designed to be concise 
and precise and can be easily read in its raw form and written by hand.

Evaluative systems like Sage, MatLab, and Mathematica are designed to calculate mathematical 
expressions.  They are good, for example, at evaluating the definite integral of a particular 
function.  MathLingua, on the other hand, is designed to describe mathematical knowledge, 
such as the fundamental theorem of calculus, rather than perform calculations.

Last, proof languages and technologies are designed to describe mathematical statements in 
a precise format using a fixed logical framework to allow the proofs of statements to be 
automatically verified by computers.

Such systems have a very steep learning code, and require mathematical statements to be 
described to using a particular framework.

One common framework used in proof assistants such as Coq and Lean is the Calculus of 
Constructions based on Martin-Löf type theory.  This framework follows intuitionistic 
mathematics that, roughly speaking, requires constructive proofs of theorems and mathematical 
entities.

Another framework is Simple Type Theory or Higher Order Logic that is used by proof assistants 
such as Isabelle and HOL and HOL Light.  This framework is an extension of second order logic.

Mathlingua uses a type theory inspired by Simple Type Theory with some extensions, but is 
designed to describe mathematical objects, not describe proofs.  That is, proofs are written 
in natural language (although future version of Mathlingua may provide a proof language),

Moreover, the purpose of Mathlingua is enable one to read and write mathematical statements in 
a way that is very similar to the way they are written in mathematical textbooks and journals 
without having to know any technical details of type theory.

That is, Mathlingua is designed so that you do not need to know type theory to read, write, or 
understand statements written in Mathlingua.

# Capturing All Aspects of a Piece of Mathematical Knowledge

MathLingua not only allows the precise description of a mathematical statement but is designed 
to record all aspects of knowledge about that statement, such as what it is called when spoken, 
how it is written, its background and impact, who discovered it, etc.

Consider the following example (Some parts of the example have been omitted with `...` for 
clarity.  Full examples with follow later in this document):

```
[\definite.riemann.integral[x]{f[x]}:from{a}:to{b]]
Defines: S
...
Documented:
. written: "\int_{a?}^{b?} f?(x?) \: d x?"
. called: "Definite Riemann Integral of $f?(x?)$ on $[a?, b?]$"
. overview: "Precisely speaking, the Rieman Integral is ..."
. motivation: "The Rieman Integral was developed because ..."
. discovered: "@Bernhard.Riemann"
...
References:
. "$Royden.Real.Analysis.Edition2:page{23}"
```

Note that the `Documented:written:` section describes how the definite Riemann integral of a 
function on an interval is rendered with LaTeX.  The `Documented:called:` section, on the other 
hand, describes how one would describe the definite Riemann integral when spoken out loud.

The `Documented:overview` section contains a description of the Riemann Integral in a natural 
langugage.  In addition, the motivation behind its importance is recorded in the 
`Documented:motivation:` section, and a list of people that contributed to its discovery in 
the `Documented:discovered:` section.

Last, the `References:` section provides a list of references for further information.  As such, 
the MathLingua entry for the Definite Riemann Integral captures many aspects of the definition 
of the Definite Riemann Integral besides its formal statement.

> Note the use of `@` in `@Bernhard.Riemann` and `$` in `$Royden.Real.Analysis.Edition2:page{23}`.
These are sigils used to reference people and references.  Similarly, the sigil `\` is used to 
reference definitions, theorems, axioms, and conjectures.  We will learn more about these sigils 
later in the text.

The `Documented:written:` section is very important since it decouples the way a mathematical 
concept is represented on paper from the name used to reference the concept, in this case 
`\definite.riemann.integral[x]{f[x]}:from{a}:to{b}`.  The full reference name can be long so 
that it is clear what it represents, while the 'Documented:written:' section is used to "render" 
a statement written in Mathlingua to provide a form that matches how the concept is written on 
paper.

As an example, consider an example theorem (with parts omitted with `...` for clarity).

```yaml
Theorem:
...
then:
. '\definite.riemann.integral[x]{f(x)}:from{0}:to{1} = 0'
```

The MathLingua build tool `mlg` (discussed in later sections) uses the LaTeX form of 
`\definite.riemann.integral' in its `Documented:written:` section to render the theorem 
statement as:

```yaml
Theorem:
...
then:
. $\int_{0}^{1} f(x) \: dx = 0$
```

Thus, the rendered form of the statement expresses the definite Riemann integral in the way 
it is typically written on paper, while the original MathLingua source can be viewed to see 
what the statement precisely means in case of ambiguities.

To understand when such ambiguities might exist, suppose the rendered form of a MathLingua 
statement contained the rendered item:

$$\int f$$

What does that text represent?  It could mean the Riemann integral, Lebesgue integral, Daniel 
integral, or perhaps something entirely different.  However, the original source of the 
MathLingua statement would be explicit.  Perhaps it would say `\riemann.integral{f}` or 
`\lebesgue.integral{f}` to be unambiguous.

## `mlg`: The Mathlingua Command Line Tool

The official command line tool for processing Mathlingua files is `mlg`.  It provides 
functionality for checking Mathlingua files for errors as well as viewing rendered forms 
of the documents.

### Installation

`mlg` comes as a standalone file, and is available for Linux, MacOS, and Windows for both 
x86_64 and ARM architectures.

To install `mlg`, simplify download, from the GitHub releases page, the appropriate file for 
your operating system and computer architecture and save it to your computer.

> Note:  Depending on where you save the `mlg` executable, you may need to update your 
system's `PATH` variable to instruct the system where to find the `mlg` executable.

### Project Structure

Mathlingua files are text files encoded in UTF-8 that end with a `.math` extension.

If you open a terminal and execute the `mlg` tool, it will process all files with a `.math` 
extension recursively in the current working direction ignoring any files or directories that 
start with a `.`.

> Ignoring files and directories starting with a `.` means the `.git` directory used by `git` 
to store information, and other similar directories are automatically ignored.

### Commands

The `mlg` tool is invoked using the format `mlg <command> [options]` where `<command>` is one 
of `check`, `view`, `version`, or `help` and the optional `[options]` a specific to the 
command specified.  For any command, the `--help` option can be used to get a printout of help 
info for that specific command.

#### `check`

Running `mlg check` recursively checks of `.math` files in the current working directory and 
prints any diagnostic messages to the console.  The type of checks performed include but are 
not limited to:

* Syntax errors
* Referencing a non-existent definition, theorem, resource, person, etc.
* The existence of multiple definitions, theorems, resources, people, etc. with the same signature
* Referencing a definition, theorem, resource, person, etc. incorrectly (i.e. with the wrong 
  number or type of arguments)
* Ambiguous uses of operators

See the chapter, **Checking Mathlingua Documents** for more information about the type of 
checks performed and how to fix any errors returned.

The `mlg check` command can also be given an optional list of one or more `.math` files.  In that 
case, all `.math` files in the current working directory and any subdirectory are checked, but 
only diagnostic message in the specified files are printed to the console.  This is useful for 
debugging individual files.

#### `view`

As describing in the **Introduction**, Mathlingua files written using the Mathlingua syntax, 
where each definition specifies how it would be represented when written on paper, for example 
in a textbook or journal.

That information is used to render Mathlingua documents, and the `mlg view` command starts a 
server that hosts those documents on `localhost:8080`.  To view the documents open your browser 
at `localhost:8080`, as shown below:

![](./view-screenshot.png)

To use a different port number, use the `--port` option.  For example, `mlg view --port 3000` 
will have the documentation served on port 3000.

For more information, see the chapter **Rendering Mathlingua Documents**.

#### `version`

The `mlg version` command is used to determine which version of the Mathlingua tooling you 
are using.

#### `help`

The `mlg help` command is used to print information describing how to use the `mlg` command.  
Each command also supports the `--help` option to print usage information for that command, 
for example `mlg check --help`.

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

