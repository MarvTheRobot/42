rm -rf resources

rm -rf public && mkdir public &&
git worktree prune &&
rm -rf .git/worktrees/public/

git worktree add -B gh-pages public origin/gh-pages

rm -rf public/*

echo "Generating site"
#hugo

echo "Updating gh-pages branch"
#cd public && git add --all && git commit -m "Update site content" && cd ..

#echo "Pushing to github"
#git push --all