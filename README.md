git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Vu Pham'; GIT_AUTHOR_EMAIL='vutpham@outlook.com'; GIT_COMMITTER_NAME='Vu Pham'; GIT_COMMITTER_EMAIL='vutpham@outlook.com';" HEAD

git push -f
