# Contributing Guidelines

This Documentation contains a set of guidelines to help you during the contribution workflow.
We are happy to welcome all the contributions from anyone willing to improve/add new features or resolve existing issues and bugs. Thank you for helping out and remember,
**no contribution is too small.**

# Steps to Follow for Contributing to this Project

## Step 1 : Find an Issue
- Go through the Existing Issues or create your **own** Issues!
- Explain your Solution/Approach to resolve the selected issue to the Maintainer in the Issues Section.
- Wait for the Issue to be assigned to you after which you can start working on it.

## Step 2 : Fork and Cloning the Project
- Forking this Repo will create a Local copy of this project on Github.
```

$ git clone https://github.com/<your-username>/Libro.git
$ cd Libro
```

## Step 3 : Set a Remote to the Original Repo
- if you check remotes of your cloned project , you'll notice that you already have a reference to your Forked Repo named as Origin.
```
#run this command to check remotes of your cloned repo
$ git remote -v
```

- Remotes are references to fetch or pull any recent changes in the original codebase to your copy of project.

```

$ git remote add upstream https://github.com/infiniteoverflow/Libro
```

## Step 4 : Create a Branch
- Its preffered to do all your work on a seperate branch , keeping the main branch clean.

```
$ git checkout -b branch_name
```

## Step 5 : Start Working on the Issue assigned
- Add all files/folders needed.
- After making all changes/implementations add all those changes to the respective branch by :
```

$ git add .
```

## Step 6 : Commit all Changes
- Commit or save all those added changes with a convenient message so that reviewer can understand what changes you did.

```

$ git commit -m 'your-commit-message-here'
```

## Step 7 : Push all Changes
- After you are done with your contribution. Push all those changes to your Forked Repo on Github.

```

$ git push -u origin branch_name
```

## Step 8 : Create a Pull Request
- Go to your forked Repo in browser and click on compare and pull requests.
- Add a title and description to your PR describing about your contribution.

- Congratulations! Your PR has been submitted and will be reviewed by the maintainers and merged.
