This repository fetched packages from the cargo repository, builds them, using the rust toolchain, and outputs llvm
code.

# A description of files in order of their usage

1. **crates.ipynb**: cargo's fair usage policy states that directly crawling the API or webpages is discouraged. Cargo instead provides [a dump](https://crates.io/data-access) that contains SQL as well as CSV files. I used this python notebook to do some EDA on this data, and some basic data cleaning such as sorting packages by downloads, and removing packages that do not have a repo listed. I currenly output top 1000 packages that fit the repository criteria, but this notebook can be used to obtain more.
2. **downloader.sh**: takes the output list of the notebook, and download these packages. Currently we fetch 100 top packages, but it is trivial to expand.
3. **compiler.sh** takes the output of downloader and compiles them to llvm-ir, it has some extra conditionals that allow it to run on the same dump multiple times without doing redundant work. This script actually produces the LLVM IR code.
4. **bundler.sh** counts the number of llvms file generated in build folder, and compiles them to a single file.