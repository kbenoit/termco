NEWS
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor
  and patch)
* New additions without breaking backward compatibility bumps the minor
  (and resets the patch)
* Bug fixes and misc changes bumps the patch



termco 0.5.0 -
----------------------------------------------------------------

**BUG FIXES**

* `ngram_collocations` did not properly merge the **quanteda** outputs resulting
  in the `length` column being replicated multiple times.  Additionally, length
  was integer whereas the other ngram measures are numeric resulting in a
  **data.table** warning in `melt`.  Both of these issues have been addressed.

* `colo` did not copy a single term to the clipboard with quotes.  See
  <a href="https://github.com/trinker/termco/issues/50">issue #50</a>.

**NEW FEATURES**

* `plot_upset` added to enable exploration of overlapping instersections between
  `term_count` categories: http://caleydo.org/tools/upset.

* `get_text` added to extract the original text associated with particular tags.

* `frequent_terms_co_occurrence` added to view the co-occurrence between frequent
  terms.  A combination of `frequent_terms` and `tag_co_occurrence`.

* `term_before`, `term_after`, & `term_first` added to get frequencies of terms
  relative to other terms or specific locations.

* `token_count` added to count the occurrence of tokens within a vector of
  strings.  This function differs from`term_count` in that `term_count` is
  regex based, allowing for fuzzy matching.  This function only searches for
  lower cased tokens (words, number sequences, or punctuation) providing a well
  defined counting function that is faster than `term_count` but less flexible.

* `as_term_list` added.  This is a convenience function to convert a vector of
  terms or a quanteda `dictionary` into a named list.

* `combine_counts` added to enable combining `term_count` and `token_count`
  objects.

* `match_word` added to match words to regular expressions.  Roughly equivalent
  **qdap**'s `term_match`.

* `read_term_list`/`write_term_list` added to aid in the reading in/writing out
  and formatting of term list files.

* `classification_template` added to manually add a classification script
  template.  This template has a suggested **termco** based workflow that may be
  useful for classification projects.

* `test_regex` added to test an atomic vector, list, or term list of regexes for
  validity.

* `mutate_term_count` added to apply a normalizing function to all the term columns
  of a `termco` object without stripping the attributes and class.

* `drop_terms` added to allow the user to explore/iterate on a term list and
  drop terms prior prior to \code{term_count} use without manually editing an
  external term list file.

* `tidy_counts` added to converts a wide matrix of counts to tidy form (tags are
  stretched long-wise with corresponding counts of tags).

* `set_meta_tags` added for setting the `metatags` attribute on a
  `term_count/`token_count` object.  This can also be controlled by separators
  in the term/token list passed to `term_count/`token_count`.

**MINOR FEATURES**

* `important_terms` picks up a plot method corresponding to the `frequent_terms`
  plot method.

* `term_count` checks for duplicate categories within tiers for hierarchical
  term lists.

* `read_term_list` checks for valid regex.

**IMPROVEMENTS**

* `validate_model` now uses `classify` before validating to assign tags.

* `tag_co_occurrence` used a grid + base plotting approach that required
  restarting the graphics device between plots.  This dependency has been
  replaces with a dependency on **ggraph** for plotting networks as grid
  objects.

* `plot.validate_model` now shows tag counts in the sample to provide a relative
  importance of the accuracy in making decisions.

* Open, unescaped or regexes [(i.e., `|)` unescaped pipe followed by a closing
  group character] are now caught and warned for `read_term_list` and thus
  `term_count`.

**CHANGES**

* `as_dtm` & `as_tdm` moved to the **gofastr** package where they can be used by
  other packages and their classed objects.  **termco** re-exports the two
  functions.

* `summary.validate_model` used to return `n` which was the number of tags from
  the `termco` object.  It now gives n.tags and n.classified to be more explicit
  about counts of potential tags and tags actually assigned by `classify`.

* `colo` no longer uses non-standard evaluation; terms must be quoted.

* `ngram_collocations` has been renamed to  `frequent_ngrams` for better clarity
  in what the function does and as a counter part to `frequent_terms`.

* `update_names` renamed to `rename_tags` to be consistent with naming
  conventions.

* `term_cols` renamed to `tag_cols` to be consistent with naming
  conventions.


termco 0.4.0 - 0.4.3
----------------------------------------------------------------

**NEW FEATURES**

* `term_cols` & `group_cols` added to quickly grab just term or grouping
  variable columns.

* `as_dtm` & `as_tdm` added to convert a `term_count` object into a
  `tm::DocumentTermMatrix` or `tm::TermDocumentMatrix` object.

* `update_names` added to allow for safe renaming of a `term_count` object's
  columns while also updating its attributes as well.

* `term_list_template` added for generating and writing term list templates.

**IMPROVEMENTS**

* `classify` picks up a new default `ties.method` type of `"probabilities"`.
  This used the probability distribution from all tags assigned to randomly
  break ties based on that distribution.

* `term_count` gets an auto-collapse feature for hierarchical `term.list`s with
  duplicate names.  A message is printed telling the user this is happening.  To
  get the hierarchical coverage use `attributes(x2)[['pre_collapse_coverage']]`.

* `accuracy` now uses standard model evaluation measures of macro/micro averaged
  accuracy, precision, and recall as outlined by Dan Jurafsky & Chris Manning.
  See https://www.youtube.com/watch?v=OwwdYHWRB5E&index=31&list=PL6397E4B26D00A269
  for details on the methods.

**CHANGES**

* `plot.tag_co_occurrence` uses a bubble-dotplot for the right hand graph rather
  than the older bar plot.  This allows for tag size to be displayed in addition
  to average number of other tags to determine if the tag co-occurrence is a
  meaningful number of tags to give additional attention to.  Use `tag = TRUE`
  for the old behavior.

* `accuracy` was renamed to `evaluate` to be more informative as well as a verb.



termco 0.3.0 - 0.3.6
----------------------------------------------------------------

**BUG FIXES**

* `colo` returned list rather than string if a single term was passed.  Spotted
  by Steve Simpson.  See <a href="https://github.com/trinker/termco/issues/12">issue #12</a>.

* `term_count` did not handle hierarchical `term.list` correctly due to a
  reordering done by **data.table** (when `group.vars` not `= TRUE`).  This
  has been corrected.

* Column ordering was not respected by `print.term_count`.

* `colo` did not copy to the clip board when `copy2clip` was `TRUE` and a single
  expression was passed to `...`.

**NEW FEATURES**

* `important_terms` added to compliment `frequent_terms` allowing tf-idf
  weighted terms to rise to the top.

* `collapse_tags` added to combine tags/columns from `term_count` object without
  stripping the `term_count` class and attributes.

**MINOR FEATURES**

* `plot_counts` picks up a `drop` argument to enable terms not found (if `x` is
  a `as_terms` object created from a `term_count` object) to be retained in the
  bar plot.  Suggested by Steve Simpson.  See <a href="https://github.com/trinker/termco/issues/18">issue #18</a>.

**IMPROVEMENTS**

* `colo` automatically adds a group parenthesis around `...` regexes to protect
  the grouping explicitly.  This is useful when a regex used or pipes (`|`).
  This would create an unintended expression that was overly aggressive (see #20).




termco 0.2.0
----------------------------------------------------------------

**NEW FEATURES**

* `validate_model` and `assign_validation_task` added to allow for human
  assessment of how accurate a model is functioning.

**CHANGES**

* `probe_colo_list`,`probe_colo_plot_list`, & `probe_colo_plot` all use
  `search_term_collocations` under the hood rather than `search_term` + `
  frequent_terms`.


termco 0.1.0
----------------------------------------------------------------

**BUG FIXES**

* `plot.term_count` did not properly handle weighting.  This has been fixed and
  allows for `"count"` as a choice.

* `search_term_which` (also `search_term`) did not treat te `and` argument
  correctly.  `and` was treated identical to the `not` argument.

**NEW FEATURES**

* `split_data` added for easy creation of training and testing data.

* `classification_project` added to make a classification modeling project
  template.

* `plot_cum_percent` added for cumulative percent plot of frequent terms.

* `probe_` family of functions added to easily make lists of function calls for
  exploration of the frequent terms in the context of the data.  Functions include:
  `probe_list`, `probe_colo_list`, `probe_colo_plot_list`, & `probe_colo_plot`.

* `hierarchical_coverage` added to allow exploration of the unique coverage of a
  text vector by a term after partitioning out the elements matched by previous
  terms.

* `tag_co_occurrence` added to explore tag co-occurrences.

* `search_term_collocations`   added as a convenience wrapper for `search_term`
  + `frequent_terms`. (Thanks to Steve Simpson)


**MINOR FEATURES**

* `plot_freq` picks up a `size` argument.

**IMPROVEMENTS**

* `term_count` now can be used in a hierarchical fashion.  A list of regexes can
  be passed and counted and then a second (or more) pass can be taken wit a new
  set of regexes on only those rows/text elements that were left untagged
  (count `rowSums` is zero).  This is accomplished by passing a `list` of
  `list`s of regexes.  Thanks to Steve Simpson for suggesting this feature.


termco 0.0.1
----------------------------------------------------------------

This package is a small suite of functions used to count terms and substrings
  in strings.