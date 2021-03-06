def version_banner
"Clash #{Clash::VERSION} -- a diff based testing suite for Jekyll."
end

def banner(options)
  banner = if options[:init]
    init_banner
  elsif options[:accept]
    accept_banner
  else
    default_banner
  end

  "#{version_banner}\n\n#{banner}"
end

def default_banner
<<-BANNER
Usage:
  $ clash [dir] [tests] [options]          # Run tests
  $ clash accept [dir] [tests] [options]   # Accept build: overwrite expected files with build files
  $ clash init PATH [options]              # Add testing scaffold

Options:
BANNER
end

def init_banner
<<-BANNER
Add testing scaffold.

Usage:
  $ clash init PATH [options]

Options:
BANNER
end

def accept_banner
<<-BANNER
This accepts a build, overwriting expected files with build files.

Usage:
  $ clash accept [dir] [tests] [options]

Options:
BANNER
end

def default_examples
<<-EXAMPLES

Examples:
  To run only specific tests, pass test numbers separated by commas.

    $ clash           # Run all tests
    $ clash 1         # Run only the first test
    $ clash 2,3       # Run the second and third tests
    $ clash 2-4       # Run the second, third, and fourth tests
    $ clash :10       # Run the test on line 10
    $ clash :10-:35   # Run all tests from line 10 to 35
    $ clash awesome   # Run all tests in the 'awesome' directory, reading awesome/_clash.yml.
    $ clash awesome 1 # Run the first test in the 'awesome' directory.
EXAMPLES
end

def accept_examples
<<-EXAMPLES

Examples:
  To run only specific tests, pass test numbers separated by commas.

    $ clash accept           # Accept all test builds
    $ clash accept 1         # Accept build from test 1
    $ clash accept 2,3       # Accept builds from tests 2 and 3
    $ clash accept :10       # Accept build from test on line 10
    $ clash accept :10-:35   # Accept builds from tests on line 10 through 35
    $ clash accept awesome 1 # Accept the first build from tests in the awesome dir
EXAMPLES
end

def config_info
<<-CONFIG_INFO

Configuration:
  Clash loads tests from a _clash.yml file in the current directory or the './test' directory if not found.
  A simple clash file with one test might look like this:

    title: Test Build           # Name for your test
    dir: site                   # Dir containing your Jekyll test site
    build: true                 # Run Jekyll build
    compare: _expected _site    # Compare the contents of _expected/ to _site/

  A clash test can be configured with the following options. Each of these is optional.

  | Option           | Type           | Description                                                |
  |:-----------------|:---------------|:-----------------------------------------------------------|
  | title            | String         | A descriptive name for the test                            |
  | dir              | String         | Scope tests to this directory.                             |
  | before           | String/Array   | Run system command(s) before running tests.                |
  | build            | Boolean        | Build the site with Jekyll.                                |
  | config           | Hash           | Configure Jekyll, Octopress Ink plugins. (Info below)      |
  | compare          | String/Array   | Compare files or directories. Format: "_expected _site"    |
  | after            | String/Array   | Run system command(s) after running tests.                 |
  | enforce_missing  | String/Array   | Ensure that these files are not found.                     |
  
  View the README or visit https://github.com/imathis/clash to learn about configuration clash tests.

CONFIG_INFO
end
