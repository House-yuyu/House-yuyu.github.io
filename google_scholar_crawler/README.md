# Google Scholar citation updater

Google Scholar often blocks shared GitHub-hosted runner IP addresses. This
updater is intended to run on a trusted local computer or server and publish
the validated snapshot to the `google-scholar-stats` branch.

## First-time setup

Use Python 3.10 or newer.

Linux/macOS:

```bash
cd google_scholar_crawler
python3.10 -m venv .venv
.venv/bin/pip install -r requirements.txt
./git_update.sh
```

Windows PowerShell:

```powershell
cd google_scholar_crawler
py -3.10 -m venv .venv
.venv\Scripts\pip.exe install -r requirements.txt
.\git_update.bat
```

The repository's `origin` push URL must be authenticated. The generated JSON
files live under the ignored `results/` directory and are force-pushed to the
dedicated statistics branch; the website source branch is not modified.

## Daily scheduling

On an always-on Linux/macOS machine, run `crontab -e` and add a daily job such
as:

```cron
17 16 * * * /absolute/path/to/google_scholar_crawler/git_update.sh >> /tmp/xu-zhang-scholar.log 2>&1
```

On Windows, create a daily Task Scheduler task whose program is
`google_scholar_crawler\git_update.bat`.
