# Development Guidelines
This doc explains the development guide for the project when contributing to the codebase. It should serve as a reference for all contributors, and be useful especially to new and infrequent submitters.

<!-- TOC -->
- [Conventional Commit Guidelines](#conventional-commit-guidelines)
  * [Summary](#summary)
  * [Specification](#specification)
  * [Why Use Conventional Commits](#why-use-conventional-commits)
  * [Examples](#examples)
- [Git Guidelines](#git-guidelines) 
  * [Commit Message](#commit-message)
  * [Commit Sign-off](#commit-sign-off)
- [Pull Request Guidelines](#pull-request-guidelines)
  * [Pull Request Message](#pull-request-message)
  * [Pull Request Submit Process](#pull-request-submit-process)
  * [Why was my pull request closed?](#why-was-my-pull-request-closed)
  * [Why is my pull request not getting reviewed?](#why-is-my-pull-request-not-getting-reviewed)
  * [Best Practices for Faster Reviews](#best-practices-for-faster-reviews)
<!-- /TOC -->

## Conventional Commit Guidelines
This project uses the [Conventional Commit](https://www.conventionalcommits.org/en/v1.0.0/) specifications that are a lightweight convention on top of commit & PR messages. It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of. This convention dovetails with [SemVer](http://semver.org/), by describing the features, fixes, and breaking changes made in commit messages.

### Summary
The commit message should be structured as follows:

```md
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements to communicate intent:

1. **fix:** a commit of the *type* fix patches a bug in the codebase (this correlates with `PATCH` in Semantic Versioning).
2. **feat:** a commit of the *type* `feat` introduces a new feature to the codebase (this correlates with `MINOR` in Semantic Versioning).
3. **BREAKING CHANGE:** a commit that has a *footer* `BREAKING CHANGE:`, or appends a `!` after the *type/scope*, introduces a breaking API change (correlating with `MAJOR` in Semantic Versioning). A `BREAKING CHANGE` can be part of commits of any *type*.
4. *types* other than `fix:` and `feat:` are allowed, for example [@commitlint/config-conventional](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional) recommends `build:`, `chore:`, `refactor:`, `docs:`, `test:`, and others.
5. *footers* other than `BREAKING CHANGE:` may be provided and follow a convention similar to [git trailer format](https://git-scm.com/docs/git-interpret-trailers).

Additional types are not mandated by the Conventional Commits specification, and have no implicit effect in Semantic Versioning (unless they include a BREAKING CHANGE). A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g. `feat(parser): add ability to parse arrays`.

### Specification
The keywords “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

1. Commits MUST be prefixed with a type, which consists of a noun, `feat`, `fix`, etc., followed by the OPTIONAL scope, OPTIONAL `!`, and REQUIRED terminal colon and space.
2. The type `feat` MUST be used when a commit adds a new feature to your application or library.
3. The type `fix` MUST be used when a commit represents a bug fix for your application.
4. A scope MAY be provided after a type. A scope MUST consist of a noun describing a section of the codebase surrounded by parenthesis, e.g. `fix(parser):`
5. A description MUST immediately follow the colon and space after the type/scope prefix. The description is a short summary of the code changes, e.g. *fix: array parsing issue when multiple spaces were contained in string*.
6. A longer commit body MAY be provided after the short description, providing additional contextual information about the code changes. The body MUST begin one blank line after the description.
7. A commit body is free-form and MAY consist of any number of newline separated paragraphs.
8. One or more footers MAY be provided one blank line after the body. Each footer MUST consist of a word token, followed by either a `:<space>` or `<space>#` separator, followed by a string value (this is inspired by the [git trailer convention](https://git-scm.com/docs/git-interpret-trailers)).
9. A footer’s token MUST use `-` in place of whitespace characters, e.g. `Acked-by` (this helps differentiate the footer section from a multi-paragraph body). An exception is made for `BREAKING CHANGE`, which MAY also be used as a token.
10. A footer’s value MAY contain spaces and newlines, and parsing MUST terminate when the next valid footer token/separator pair is observed.
11. Breaking changes MUST be indicated in the type/scope prefix of a commit, or as an entry in the footer.
12. If included as a footer, a breaking change MUST consist of the uppercase text BREAKING CHANGE, followed by a colon, space, and description, e.g. *BREAKING CHANGE: environment variables now take precedence over config files*.
13. If included in the type/scope prefix, breaking changes MUST be indicated by a `!` immediately before the `:`. If `!` is used, `BREAKING CHANGE:` MAY be omitted from the footer section, and the commit description SHALL be used to describe the breaking change.
14. Types other than `feat` and `fix` MAY be used in your commit messages, e.g. *docs: update ref docs*.
15. The units of information that make up Conventional Commits MUST NOT be treated as case-sensitive by implementors, except BREAKING CHANGE which MUST be uppercase.
16. BREAKING-CHANGE MUST be synonymous with BREAKING CHANGE, when used as a token in a footer.

### Why Use Conventional Commits
- Automatically generating CHANGELOG.
- Automatically determining a semantic version bump (based on the types of commits landed).
- Communicating the nature of changes to teammates, the public, and other stakeholders.
- Triggering build and publish processes.
- Making it easier for people to contribute to your projects by allowing them to explore a more structured commit history.

### Examples
#### Commit message with description and breaking change footer
```md
feat: allow provided config object to extend other configs
BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

#### Commit message with `!` to draw attention to breaking change
```md
feat!: send an email to the customer when a product is shipped
```

#### Commit message with scope and `!` to draw attention to breaking change
```md
feat(api)!: send an email to the customer when a product is shipped
```

#### Commit message with both `!` and BREAKING CHANGE footer
```md
chore!: drop support for Node 6

BREAKING CHANGE: use JavaScript features not available in Node 6.
```

#### Commit message with no body
```md
docs: correct spelling of CHANGELOG
```

#### Commit message with scope
```md
feat(lang): add Polish language
```

#### Commit message with multi-paragraph body and multiple footers
```md
fix: prevent racing of requests

Introduce a request id and a reference to the latest request. Dismiss
incoming responses other than from the latest request.

Remove timeouts which were used to mitigate the racing issue but are
obsolete now.

Reviewed-by: Z
Refs: #123
```

---

## Git Guidelines
This section provides guidelines and recommendations for using Git when contributing to the project. It covers a variety of topics and general tips for making your contribution more efficient and effective. This section is crucial for maintaining a clean, understandable history of the project and ensuring smooth collaboration among contributors.

### Commit Message
The project uses [conventional commit](#conventional-commit-guidelines) specifications for a commit message. These are particularly important as semantic releases are in use, and they use the commit messages to determine the type of changes in the codebase. Following formalised conventions for commit messages the semantic release automatically determines the next [semantic version](https://semver.org) number and generates a changelog based on the conventional commit.

The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The commit contains the following structural elements to communicate intent:

1. Any line of the commit message cannot be longer than 100 characters! This allows the message to be easier to read on GitHub as well as in various git tools.
2. The *description* contains a succinct statement of the change. It should use the imperative, present tense: "change" not "changed" nor "changes", don't capitalize the first letter and no dot (.) at the end.
3. `fix:` a commit of the *type* fix patches a bug in the codebase (this correlates with `PATCH` in Semantic Versioning).
4. `feat:` a commit of the *type* `feat` introduces a new feature to the codebase (this correlates with `MINOR` in Semantic Versioning).
5. `BREAKING CHANGE:` a commit that has a *footer* `BREAKING CHANGE:`, or appends a `!` after the *type/scope*, introduces a breaking API change (correlating with `MAJOR` in Semantic Versioning). A `BREAKING CHANGE` can be part of commits of any *type*.
6. *types* other than `fix:` and `feat:` are allowed, and are defined in [semantic.yml](../../.github/semantic.yml), but will have no implicit effect in Semantic Versioning (unless they include a BREAKING CHANGE).
7. *footers* other than `BREAKING CHANGE:` may be provided and follow a convention similar to [git trailer format](https://git-scm.com/docs/git-interpret-trailers).
8. A **scope** may be provided to a commit’s *type*, to provide additional contextual information and is contained within parenthesis, e.g., `feat(parser): add ability to parse arrays`.

### Commit sign-off
A [Developer Certificate of Origin](https://en.wikipedia.org/wiki/Developer_Certificate_of_Origin) is required for all commits. It can be provided using the [sign-off](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---signoff) option for `git commit` or by GPG signing the commit. The developer certificate is available at (https://developercertificate.org/).

The project enforces the DCO using the [bot](https://github.com/probot/dco). You can view the details on the DCO check by viewing the `Checks` tab in the GitHub pull request.

![DCO sign-off check](https://user-images.githubusercontent.com/13410355/42352794-85fe1c9c-8071-11e8-834a-05a4aeb8cc90.png)

There are a couple of ways to ensure your commits are signed. Described below are three different ways to sign your commits: using git sign-off, using GPG, or using webhooks.

#### Git sign-off
Git sign-off adds a line to your commit message with the user.name and user.email values from your git config. Use git sign-off by adding the `--sign-off` or `-s` flag when creating your commit. This flag must be added to each commit you would like to sign.

```sh
git commit -m -s "docs: my commit message"
```

If you'd like to keep your personal email address private, you can use a GitHub-provided `no-reply` email address as your commit email address. GitHub provides [good instructions on setting your commit email address](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address).

#### GPG sign your commits
A more secure alternative is to GPG sign all your commits. This has the advantage that as well as stating your agreement to the DCO, it also creates a trust mechanism for your commits. There is a good guide from GitHub on how to set this up:

1) If you don't already have a GPG key, then follow [this guide to create one](https://help.github.com/en/articles/generating-a-new-gpg-key).

2) Now you have a GPG key, [tell GitHub about your key so that it can verify your commits](https://help.github.com/en/articles/adding-a-new-gpg-key-to-your-github-account). Once you upload your public gpg key to your GitHub account, GitHub will mark commits that you sign with the `verified` label.

3) To sign commits locally, you can add the `-S` flag when creating your commit. For more information on signing commits locally, follow [this guide to see how to sign your commit](https://help.github.com/en/articles/signing-commits).

4) You can configure git to always use signed commits by running

```sh
git config --global user.signingkey <key id>
```

The process to find the key id is described in [this guide on checking for existing GPG keys](https://help.github.com/en/articles/checking-for-existing-gpg-keys).

1) Set up a keychain for your platform. This is entirely optional but means you don't need to type your passphrase every time and allows git to run headless. If you are using a Mac GPG Suite is a good way to do this. If you are on another platform, please open a PR against this document and add your recommendations!

#### Use a webhook to sign your commits
Alternatively, you can use a hook to make sure all your commits messages are signed off.

1) Run:
```sh
mkdir -p ~/.git-templates/hooks
```
```sh
git config --global init.templatedir ~/.git-templates
```

1) Then add this to `~/.git-templates/hooks/prepare-commit-msg`:

```bash
#!/bin/sh

COMMIT_MSG_FILE=$1  # The git commit file.
COMMIT_SOURCE=$2    # The current commit message.

# Add "Signed-off-by: <user> <email>" to every commit message.
SOB=$(git var GIT_COMMITTER_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
git interpret-trailers --in-place --trailer "$SOB" "$COMMIT_MSG_FILE"
if test -z "$COMMIT_SOURCE"; then
/usr/bin/perl -i.bak -pe 'print "\n" if !$first_line++' "$COMMIT_MSG_FILE"
fi
```

1) Make sure the file is executable:
```sh
chmod u+x ~/.git-templates/hooks/prepare-commit-msg
```

1) Run `git init` on the repo you want to use the hook on.

Note that this will not override the hooks already defined on your local repo. It adds the `Signed-off-by: ...` line after the user has created the commit message.

---

## Pull Request Guidelines
This doc explains the process and best practices for submitting a pull request for the project when contributing to the codebase. It should serve as a reference for all contributors, and be useful especially to new and infrequent submitters.


### Pull Request Message
This project uses [conventional commits](#conventional-commit-guidelines) as its PR message format. These are particularly important as semantic releases are in use, and they use the PR message to determine the type of changes in the codebase. Following formalized conventions for PR messages the semantic release automatically determines the next [semantic version](https://semver.org) number and generates a changelog based on the conventional commit.

#### Pull Request Title
The pull request title should follow the below structured:

```md
<type>[optional scope]: <description>
```

Example:
```md
feat(parser): add ability to parse arrays (#123)
```

The pull request title contains the following structural elements to communicate intent:

1. The *description* contains a succinct statement of the change. It should use the imperative, present tense: "change" not "changed" nor "changes", don't capitalize the first letter and no dot (.) at the end.
2. `fix:` a pull request of the *type* fix patches a bug in the codebase (this correlates with `PATCH` in Semantic Versioning).
3. `feat:` a pull request of the *type* `feat` introduces a new feature to the codebase (this correlates with `MINOR` in Semantic Versioning).
4. `BREAKING CHANGE` is a pull request that appends a `!` after the *type/scope*, and correlates with a `MAJOR` in Semantic Versioning. A `BREAKING CHANGE` can be part of any PR *type*.
5. *types* other than `fix:` and `feat:` are allowed, such as `chore:`, `refactor:`, `test:` & `docs:` but will have no implicit effect in Semantic Versioning (unless they include a BREAKING CHANGE).
6. A **scope** may be provided to the pull request’s *type*, to provide additional contextual information and is contained within parenthesis, e.g., `feat(parser): add ability to parse arrays`.

### Pull Request Submit Process
Merging a pull request requires the following steps to be completed before the pull request will be merged automatically.

- [Open a pull request][How2PR]
- Pass all tests
- Get all necessary approvals from reviewers and owners

#### Automated Pull Request Checks
There are a number of automated checks that will run on your PR:

- *Semantic Pull Request*
    * validates that your commit messages meet the Conventional Commit format described above, additionally, your PR must also have a conventional message. The UX for this bot is a little odd as it doesn't go red if the messages are NOT correct, instead it goes yellow. You need it to go to a green tick!
- *DCO*
    * see [Sign-off](./DEV_GUIDE.md#commit-sign-off)
<!-- TODO: Optional 
- *Hound*
    * lint the code and comments inline with any issues. You need this to go to a green tick and say, "No violations found. Woof!"
-->
- *tekton*
    * run the end-to-end tests in a new cluster using tekton. Check the logs for errors.
- *tide*
    * perform the merge when all the checks pass. Don't worry about the state of this one, it adds little info. Clicking on the details link is very helpful as it will take you to the dashboard where you can navigate to the "Tide" screen and check the status of your PR in the merge queue.

#### Testing and Merge Workflow
The merge workflow uses labels, applied by [commands][ChatOps] via comments. These will trigger actions on your pull request. Different ceProject repositories may require different labels on the path to approval. A generic explanation of how labels are used in pull requests can be found [here][Owners]. The pull request bot will also automatically apply and/or suggest labels.

*NOTE: For pull requests that are in progress but not ready for review, prefix the pull request title with `WIP` or `[WIP]` and track any remaining ToDos in a checklist in the pull request description.*

Here's the process the pull request goes through on its way from submission to merging:

1. Pull request submitted.
2. `${GITHUB_BOT_NAME}` assigns reviewers
3. If you're **not** a member of the Continuous Engineering Project organization, a Reviewer Member checks that the pull request is safe to test. If so, they comment `/ok-to-test`. Pull requests by organization members do not need this step. Now the pull request is considered to be trusted.
4. The pre-submit tests will run:

    1. Automatic tests run.
    2. If tests fail, resolve issues by pushing edits to your pull request branch
    3. If the failure is a flake, anyone on trusted pull requests can comment `/retest` to rerun failed tests

5. Reviewer suggests edits
6. Push edits to your pull request branch
7. Repeat the prior two steps as needed until reviewer(s) add `/lgtm` label
8. You squash commits at this step
9. Follow the bot suggestions to assign an OWNER who will add the `/approve` label to the pull request

Once the tests pass, and the reviewer adds the `lgtm` and `approved` labels, the pull request enters the final merge pool. The merge pool is needed to make sure no incompatible changes have been introduced by other pull requests since the tests were last run on your pull request.

Tide will manage the merge pool automatically. It uses GitHub queries to select PRs into “tide pools”, runs as many in a batch as it can (“tide comes in”), and merges them (“tide goes out”).

1. The pull request enters the merge pool if the merge criteria are met
2. If tests fail, resolve issues by pushing edits to your pull request branch
3. If the failure is a flake, anyone can comment `/retest` if the pull request is trusted
4. If tests pass, Tide automatically merges the pull request

That's the last step. Your pull request is now merged.

#### Marking Unfinished Pull Requests
If you want to solicit reviews before the implementation of your pull request is complete, you should hold your pull request to ensure that Tide does not pick it up and attempt to merge it. There are two methods to achieve this:

1. You may add the `/hold` or `/hold cancel` comment commands
2. You may add or remove a `WIP` or `[WIP]` prefix to your pull request title

The GitHub robots will add and remove the `do-not-merge/hold` label as you use the comment commands and the `do-not-merge/work-in-progress` label as you edit your title. While either label is present, your pull request will not be considered for merging.

#### Comment Commands Reference
[The commands' doc][ChatOps] contains a reference for all comment commands.


#### How the Tests Work
The end-to-end tests will post the status results to the pull request. If an e2e test fails,
`${GITHUB_BOT_NAME}` will comment on the pull request with the test history and the
comment-command to re-run that test. E.g.

> The following tests failed, say /retest to rerun them all.

### Why was my pull request closed?
Pull requests older than 90 days will be closed. Exceptions can be made for pull requests that have active review comments, or that are awaiting other dependent pull requests. Closed pull requests are easy to recreate, and little work is lost by closing a pull request that subsequently needs to be reopened. We want to limit the total number of pull requests in flight to:
* Maintain a clean project
* Remove old pull requests that would be challenging to rebase as the underlying code has changed over time
* Encourage code velocity

### Why is my pull request not getting reviewed?
A few factors affect how long your pull request might wait for review.

If it's the last few weeks of a milestone, we need to reduce churn and stabilise.

Or, it could be related to best practices. One common issue is that the pull request is too big to review. Let's say you've touched 39 files and have 8657 insertions. When your would-be reviewers pull up the diffs, they run away—this pull request is going to take 4 hours to review, and they don't have 4 hours right now. They'll get to it later, just as soon as they have more free time (ha!).

There is a detailed rundown of best practices, including how to avoid too-lengthy pull requests, in the next section.

But, if you've already followed the best practices, and you still aren't getting any pull request love, here are some things you can do to move the process along:

* Make sure that your pull request has an assigned reviewer (assignee in GitHub). If not, reply to the pull request comment stream asking for a reviewer to be assigned. This is done via a [bot command][ChatOps] (the bot may have suggestions for this) and looks like this: `/assign @username`.

* Ping the assignee (@username) on the pull request comment stream, and ask for an estimate of when they can get to the review.

* Ping the assignee on [Slack][Slack]. Remember that a person's GitHub username might not be the same as their Slack username.

* Ping the assignee by email (many of us have publicly available email addresses).

* If you're a member of the organization ping the [team][GitHubTeam] (via @team-name) that works in the area you're submitting code.

* If you have fixed all the issues from a review, and you haven't heard back, you should ping the assignee on the comment stream with a "please take another look" (`PTAL`) or similar comment indicating that you are ready for another review.

Read on to learn more about how to get faster reviews by following best practices.

### Best Practices for Faster Reviews
You've just had a brilliant idea on how to make the project better. Let's call that idea Feature-X. Feature-X is not even that complicated. You have a pretty good idea of how to implement it. You jump in and implement it, fixing a bunch of stuff along the way. You sent your pull request—this is awesome! And it sits. And sits. A week goes by and nobody reviews it. Finally, someone offers a few comments, which you fix up and wait for more review. And you wait. Another week or two go by. This is horrible.

Let's talk about best practices so your pull request gets reviewed quickly.


#### 1. Is the feature wanted? Create a Feature Request Issue
Are you sure Feature-X is something the project team wants or will accept? Is it implemented to fit with other changes in flight? Are you willing to bet a few days or weeks of work on it?

It's better to get confirmation beforehand.

Even for small changes, it is often a good idea to gather feedback on an issue you filed, or even ask in the appropriate Slack channel to invite discussion and feedback from code owners.


#### 2. Smaller Is Better: Small Commits, Small Pull Requests
Small commits and small pull requests get reviewed faster and are more likely to be correct than big ones.

Attention is a scarce resource. If your pull request takes 60 minutes to review, the reviewer's eye for detail is not as keen in the last 30 minutes as it was in the first. It might not get reviewed at all if it requires a large continuous block of time from the reviewer.

**Breaking up commits**

Break up your pull request into multiple commits, at logical break points.

Making a series of discrete commits is a powerful way to express the evolution of an idea or the different ideas that make up a single feature. Strive to group logically distinct ideas into separate commits.

For example, if you found that Feature-X needed some refactoring to fit in, make a commit that JUST does that refactoring. Then make a new commit for Feature-X.

Strike a balance with the number of commits. A pull request with 25 commits is still very cumbersome to review, so use judgment.

**Breaking up Pull Requests**

Or, going back to our refactoring example, you could also fork a new branch, do the refactoring there and send a pull request for that. If you can extract whole ideas from your pull request and send those as pull requests of their own, you can avoid the painful problem of continually rebasing.

The project has a fast-moving codebase - lock in your changes ASAP with your small pull request, and make merges be someone else's problem.

Multiple small pull requests are often better than multiple commits. Don't worry about flooding us with pull requests. We'd rather have 100 small, obvious pull requests than 10 unreviewable monoliths.

We want every pull request to be useful on its own, so use your best judgment on what should be a pull request vs. a commit.

As a rule of thumb, if your pull request is directly related to Feature-X and nothing else, it should probably be part of the Feature-X pull request. If you can explain why you are doing seemingly no-op work ("it makes the Feature-X change easier, I promise"), we'll probably be OK with it. If you can imagine someone finds value independently of Feature-X, try it as a pull request. (Do not link pull requests by `#` in a commit description, because GitHub creates lots of spam. Instead, reference other pull requests via the pull request your commit is in.)

#### 3. Open a Different pull request for Fixes and Generic Features
**Put changes that are unrelated to your feature into a different pull request.**

Often, as you are implementing Feature-X, you will find bad comments, poorly named functions, bad structure, weak type-safety, etc.

You absolutely should fix those things (or at least file issues, please)—but not in the same pull request as your feature. Otherwise, your diff will have way too many changes, and your reviewer won't see the forest for the trees.

**Look for opportunities to pull out generic features.**

For example, if you find yourself touching a lot of modules, think about the dependencies you are introducing between packages. Can some of what you're doing be made more generic and moved up and out of the Feature-X package? Do you need to use a function or type from an otherwise unrelated package? If so, promote! We have places for hosting more generic code.

Likewise, if Feature-X is similar in form to Feature-W which was checked in last month, and you're duplicating some tricky stuff from Feature-W, consider refactoring the core logic out and using it in both Feature-W and Feature-X. (Do that in its own commit or pull request, please.)

#### 4. Comments Matter
In your code, if someone might not understand why you did something (or you won't remember why later), comment it. Many code-review comments are about this exact issue.

If you think there's something pretty obvious that we could follow up on, add a TODO.

#### 5. Test
Nothing is more frustrating than starting a review, only to find that the tests are inadequate or absent. Very few pull requests can touch code and NOT touch tests.

If you don't know how to test Feature-X, please ask!  We'll be happy to help you design things for easy testing or to suggest appropriate test cases.

#### 6. Squashing and Commit Titles
Your reviewer has finally sent you feedback on Feature-X.

Make the fixes, and don't squash yet. Put them in a new commit, and re-push. That way your reviewer can look at the new commit on its own, which is much faster than starting over.

We might still ask you to clean up your commits at the very end for the sake of a more readable history, but don't do this until asked: typically at the point where the pull request would otherwise be tagged `LGTM`.

Follow the [Commit message guidelines](#commit-message) for your commit title.

**General squashing guidelines:**

* Sausage => squash

Do squash when there are several commits to fix bugs in the original commit(s), address reviewer feedback, etc. Really we only want to see the end state and commit message for the whole pull request.

* Layers => don't squash

Don't squash when there are independent changes layered to achieve a single goal. For instance, writing a code nugget could be one commit, applying it could be another, and adding a pre-commit check could be a third. One could argue they should be separate pull requests. However, there's really no way to test/review the nugget without seeing it applied, and there needs to be a pre-commit check to ensure the munged output doesn't immediately get out of date.

A commit, as much as possible, should be a single logical change.

#### 7. KISS, YAGNI, MVP, etc.
Sometimes we need to remind each other of core tenets of software design—Keep It Simple, You Aren't Gonna Need It, Minimum Viable Product, and so on. Adding a feature "because we might need it later" is antithetical to software that ships. Add the things you need NOW and (ideally) leave room for things you might need later—but don't implement them now.

#### 8. It's OK to Push Back
Sometimes reviewers make mistakes. It's OK to push back on changes your reviewer requested. If you have a good reason for doing something a certain way, you are absolutely allowed to debate the merits of a requested change. Both the reviewer and reviewer should strive to discuss these issues in a polite and respectful manner.

You might be overruled, but you might also prevail. We're pretty reasonable people. Mostly.

Another phenomenon of open-source projects (where anyone can comment on any issue) is the dog-pile - your pull request gets so many comments from so many people it becomes hard to follow. In this situation, you can ask the primary reviewer (assignee) whether they want you to fork a new pull request to clear out all the comments. You don't HAVE to fix every issue raised by every person who feels like commenting, but you should answer reasonable comments with an explanation.

#### 9. Common Sense and Courtesy
No document can take the place of common sense and good taste. Use your best judgment, while you put a bit of thought into how your work can be made easier to review. If you do these things, your pull requests will get merged with less friction.

#### 10. Trivial Edits
Each incoming Pull Request needs to be reviewed, checked, and then merged.

While automation helps with this, each contribution also has an engineering cost. Therefore, it is appreciated if you do NOT make trivial edits and fixes, but instead focus on giving the entire file a review.

If you find one grammatical or spelling error, it is likely there are more in that file. You can really make your Pull Request count by checking formatting, checking for broken links, and fixing errors and then submitting all the fixes at once to that file.

**Some questions to consider:**

* Can the file be improved further?
* Does the trivial edit greatly improve the quality of the content?

---


[Owners]: OWNERS_SPEC.md#code-review-using-owners-files
[How2PR]: https://help.github.com/articles/about-pull-requests/
[Slack]: https://${SLACK_WORKSPACE}.slack.com
[GitHubTeam]: https://github.com/orgs/${GITHUB_ORG}/teams
[ChatOps]: https://jenkins-x.io/v3/develop/reference/chatops/
