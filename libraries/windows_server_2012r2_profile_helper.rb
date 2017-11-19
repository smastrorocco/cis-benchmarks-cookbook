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
        def validate_profile_name(profile_name)
          valid_profile_names    = %w(member_server domain_controller)
          profile_name_exception = "Invalid profile name specified: profile_name => #{profile_name}"

          Chef::Application.fatal!(profile_name_exception) unless valid_profile_names.include?(profile_name)
        end

        # Validate profile level
        def validate_profile_level(profile_level)
          valid_profile_levels    = [1, 2]
          profile_level_exception = "Invalid profile level specified: profile_level => #{profile_level}"

          Chef::Application.fatal!(profile_level_exception) unless valid_profile_levels.include?(profile_level)
        end
      end
    end
  end
end
