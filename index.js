const core = require('@actions/core');
const exec = require('@actions/exec');

async function run() {
  try {
    const command = core.getInput('command');
    const options = core.getInput('options');
    const convcoVersion = core.getInput('convco_version');

    const execOptions = {
      listeners: {
        stdout: (data) => {
          process.stdout.write(data);
        },
        stderr: (data) => {
          process.stderr.write(data);
        }
      }
    };

    await exec.exec('./entrypoint.sh', [command, options, convcoVersion], execOptions);
    core.setOutput('result', `convco ${command} ${options}`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();