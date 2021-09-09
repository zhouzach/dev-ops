
git clone --depth 1 --branch <tag_name> <repo_url>

--depth 1 is optional but if you only need the state at that one revision, you probably want to skip downloading all the history up to that revision.
--depth 1 to avoid downloading any non-current commits. 



git clone repo_url
cd repo
git checkout tag_name