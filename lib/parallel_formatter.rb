require "parallel_formatter/version"
require 'rspec/core/formatters/base_text_formatter'

module RSpec
  class ParallelFormatter < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register self, :example_group_started, :example_started,
                                     :example_passed, :example_pending,
                                     :example_failed

    def initialize(output)
      super
      @failed_examples = []
    end

    def example_group_started(notification)
      output.puts "GROUP STARTED: #{notification.group.description.strip}"
    end

    def example_started(notification)
      output.puts "TEST STARTED: #{notification.example.location}: " \
                  "#{notification.example.description}"
    end

    def example_passed(passed)
      output.puts passed_output(passed.example)
    end

    def example_pending(pending)
      output.puts pending_output(pending.example,
                                 pending.example.execution_result.pending_message)
    end

    def example_failed(failure)
      @failed_examples << failure.example
      output.puts failure_output(failure.example,
                                 failure.example.execution_result.exception)
      output.puts failure.fully_formatted(@failed_examples.size)
    end

    private

    def passed_output(example)
      RSpec::Core::Formatters::ConsoleCodes.wrap(
          'TEST PASSED: ' \
        "#{example.location}: " \
        " #{example.description.strip}",
          :success
      )
    end

    def pending_output(example, message)
      RSpec::Core::Formatters::ConsoleCodes.wrap(
          'TEST PENDING: ' \
        "#{example.location}: " \
        "#{example.description.strip} (PENDING: #{message})",
          :pending
      )
    end

    def failure_output(example, _exception)
      RSpec::Core::Formatters::ConsoleCodes.wrap(
          'TEST FAILED: ' \
        "#{example.location}: " \
        "#{example.description.strip} (FAILED - #{next_failure_index})",
          :failure
      )
    end

    def next_failure_index
      @next_failure_index ||= 0
      @next_failure_index += 1
    end
  end
end
