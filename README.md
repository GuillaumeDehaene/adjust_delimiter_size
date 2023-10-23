# `adjust_delimiter_size` Extension For Quarto and Pandoc

$$
( \frac{1}{n} \sum_{i=1}^n x_i )^2 \rightarrow \left( \frac{1}{n} \sum_{i=1}^n x_i \right)^2
$$

This pandoc extension automatically adjusts the size of math delimiters (e.g. parentheses) in PDF and HTML. This is only applied to $-delimited math-mode and not to raw tex.

## Installing

```bash
quarto add GuillaumeDehaene/adjust_delimiter_size
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

This extension is implemented as a Pandoc filter. It works automatically.

This extension will analyse all $-delimited math present in your .qmd or .md source document.
All delimiters will be augmented with latex code which automatically adjusts their size
to match the size of their contents.

If left, right delimiters in an expression are unmatched, then this causes a Latex-error. This extension detects this situation and replaces the equation with an error message.

This extension does not provide a solution for adjustable absolute values or adjustable norms. As far as I know, the best solution is to define a new command.

Please refer to [the example document: example.qmd](example.qmd) for a more complete guide to using this extension.

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

### For the Latex expert

The Latex expert will note that adding `left, right` commands modifies the spacing of the formula. The extension uses a [fix sourced from stackexchange](https://tex.stackexchange.com/a/2610) to minimize such issues.

