#!/usr/bin/python3

import os
import subprocess

def display_notification(message, title=''):
  title_part = 'with title "{0}"'.format(title) if title else ''
  applescript_notify = 'display notification "{0}" {1}'.format(message, title_part)
  os.system("osascript -e '{0}'".format(applescript_notify))

def setup_log_dir(path):
  if not os.path.exists(path):
    os.makedirs(path)

def run_process(log_dir_path, step_name, command, log_name, err_name):
  stdout_path = os.path.join(log_dir_path, log_name)
  stderr_path = os.path.join(log_dir_path, err_name)

  with open(stdout_path, 'w') as out_log, open(stderr_path, 'w') as err_log:
    completed = subprocess.run(command, stdout=out_log, stderr=err_log)

    if (completed.returncode):
      display_notification("{0} failed with errors. Check {1} for details".format(step_name, stderr_path), "Duplicacy Backup")
      exit(completed.returncode)

def run_backup(log_dir_path):
  command = ["/usr/local/bin/duplicacy", "backup"]
  run_process(log_dir_path, "Backup", command, "backup_out.log", "backup_errs.log")

def run_prune_phase_1(log_dir_path):
  command = ["/usr/local/bin/duplicacy", "prune", "-keep", "30:30", "-keep", "7:7", "-keep", "1:1", "-a"]
  run_process(log_dir_path, "Prune phase 1", command, "prune_1_out.log", "prune_1_errs.log")

def run_prune_phase_2(log_dir_path):
  command = ["/usr/local/bin/duplicacy", "prune"]
  run_process(log_dir_path, "Prune phase 2", command, "prune_2_out.log", "prune_2_errs.log")

if __name__ == '__main__':
  BACKUP_LOG_DIR = '/tmp/backup_log'

  display_notification("Starting backup", "Duplicacy Backup")
  setup_log_dir(BACKUP_LOG_DIR)
  run_backup(BACKUP_LOG_DIR)
  run_prune_phase_1(BACKUP_LOG_DIR)
  run_prune_phase_2(BACKUP_LOG_DIR)
  display_notification("Backup complete", "Duplicacy Backup")
