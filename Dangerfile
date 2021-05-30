# Set pr_author to assignee by default
# ref. - Danger : https://danger.systems/reference.html
# ref. - Octokit : http://octokit.github.io/octokit.rb/Octokit/Client/Issues.html#add_assignees-instance_method
repository = github.pr_json["base"]["repo"]["full_name"]
issue_number = github.pr_json["number"]
github.api.add_assignees(repository, issue_number, [github.pr_author])

# Ignore inline messages which lay outside a diff's range of PR
github.dismiss_out_of_range_messages

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# swiftlint
swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files inline_mode: true
