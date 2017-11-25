#
# Cookbook:: cis-benchmarks
# Library:: windows_server_2012r2_profile_helper
#
# Copyright:: 2017, Steve Mastrorocco, All Rights Reserved.

module CISBenchmark
  module Profile
    module Windows
      module Helper
        # Validate profile name
        def self.validate_profile_name(profile_name)
          valid_profile_names    = %w(member_server domain_controller)
          profile_name_exception = "Invalid profile name specified: profile_name => #{profile_name}"

          Chef::Application.fatal!(profile_name_exception) unless valid_profile_names.include?(profile_name)
        end

        # Validate profile level
        def self.validate_profile_level(profile_level)
          valid_profile_levels    = [1, 2]
          profile_level_exception = "Invalid profile level specified: profile_level => #{profile_level}"

          Chef::Application.fatal!(profile_level_exception) unless valid_profile_levels.include?(profile_level)
        end

        # Translate Audit Policy Inclusion Settings
        def self.translate_auditpol_setting(setting)
          setting_exception = "Audit policy setting must be a Boolean value: setting => #{setting.class}"

          Chef::Application.fatal!(setting_exception) unless [TrueClass, FalseClass].include?(setting.class)

          if setting
            'enable'
          else
            'disable'
          end
        end

        # Translate Audit Policy Inclusion Settings
        def self.translate_auditpol_inclusion_setting(success, failure)
          success_exception = "Audit policy setting must be a Boolean value: success => #{success.class}"
          failure_exception = "Audit policy setting must be a Boolean value: failure => #{failure.class}"

          Chef::Application.fatal!(success_exception) unless [TrueClass, FalseClass].include?(success.class)
          Chef::Application.fatal!(failure_exception) unless [TrueClass, FalseClass].include?(failure.class)

          if success && failure
            'Success and Failure'
          elsif success
            'Success'
          elsif failure
            'Failure'
          else
            'No Auditing'
          end
        end
      end
    end
  end
end
