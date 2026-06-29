# Convco action

Installs convco so later workflow steps can check commits, generate changelogs, and determine versions.

## Inputs

### `convco_version`

The convco version to download (default: latest)

Pass either `latest`, a tag such as `v0.6.4`, or a bare SemVer version such as `0.6.4`.
The `latest` download uses the release archive layout produced by the current release workflow.

## Example usage

```yaml
- uses: convco/convco-action
- run: convco check ${{ github.event.pull_request.base.sha }}..${{ github.event.pull_request.head.sha }}
```
