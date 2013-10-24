require 'cmd_runner/version'
require 'logger'
require 'open3'

module CmdRunner
  ##
  # Class: Command
  #
  # Runs a command and grabs STDOUT, STDERR.
  # Checks exit status to raise an exception in case of non-zero.
  #
  # Example:
  #   runner = CmdRunner::Command.new
  #   runner.work_dir = '/tmp'   # to change dir before every command
  #   runner.logger = Logger.new # to log command results
  #   runner.execute!('ls')      #=> [0, '.\n..\n', '']
  #
  class Command
    # Change directory before each command
    attr_accessor :work_dir
    # Logger to output command results
    attr_accessor :logger
    # Command to execute
    attr_writer :cmd

    def cmd
      if self.work_dir.to_s.empty?
        @cmd
      else
        "cd #{self.work_dir} && " + @cmd
      end
    end

    # Executes command.
    #
    # Raises:
    #   - {RuntimeError} if command returned non-zero status
    #
    # Returns {Array} with exit status, stdout, stderr
    def execute!
      result = ''
      error  = ''

      stdin, stdout, stderr, wait_thr = Open3.popen3(self.cmd)
      exit_status = wait_thr.value.exitstatus
      result << stdout.read
      error  << stderr.read

      raise "Command exited with non zero status: #{self.cmd}" unless exit_status.zero?
      [exit_status, result, error]
    ensure
      logger.info   '-'*25
      logger.info   "Command: #{self.cmd}"
      logger.info   result
      logger.error  error
      logger.info   '-'*25
    end

  private

    # Initializer
    #
    # Params:
    #   - cmd {String} with command to run
    #
    def initialize(cmd)
      @cmd = cmd
    end

    def logger
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end
