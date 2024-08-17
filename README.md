# Convco action

Performs convco checks, generates changelogs, and determines versions.

## Inputs

### `command`

**Required** The convco command to run (check, changelog, version).

## Outputs

### `options`

Additional options for the convco command

## Example usage

```yaml
uses: convco/convco-action
with:
  command: check
```
