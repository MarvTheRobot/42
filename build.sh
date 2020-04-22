echo "Clean up local resources"
rm -rf resources

echo "Clean up previous site builds"
rm -rf public && 
mkdir public &&
git worktree prune &&
rm -rf .git/worktrees/public/

echo "Pull clean version of site"
git worktree add -B gh-pages public origin/gh-pages
# Remove existing content
rm -rf public/*

echo "Generating site"
hugo

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Update site content" && cd ..

#echo "Pushing to github"
#git push --all
#git push origin gh-pages