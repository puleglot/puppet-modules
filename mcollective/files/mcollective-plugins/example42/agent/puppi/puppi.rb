module MCollective
    module Agent
        class Puppi<RPC::Agent
            metadata    :name        => "SimpleRPC Agent For PUPPI Commands",
                        :description => "Agent to execute PUPPI actions via MCollective",
                        :author      => "Al @ Lab42",
                        :license     => "Apache License 2.0",
                        :version     => "0.3",
                        :url         => "http://www.example42.com/",
                        :timeout     => 600

            def check_action
                    # validate :command, :shellsafe
                    reply.data = %x[puppi check].chomp
#                    reply.exitcode = $?.exitstatus
            end

            def info_action
                    reply.data = %x[puppi info].chomp
#                    reply.exitcode = $?.exitstatus
            end

            def log_action
                    reply.data = %x[puppi log -20].chomp
#                    reply.exitcode = $?.exitstatus
            end

            def deploy_action
                    validate :project, :shellsafe
                    project = request[:project]
                    reply.data = %x[puppi deploy #{project}].chomp
#                    reply.exitcode = $?.exitstatus
            end

            def rollback_action
                    validate :project, :shellsafe
                    project = request[:project]
                    reply.data = %x[puppi rollback #{project} latest].chomp
#                    reply.exitcode = $?.exitstatus
            end

            def init_action
                    validate :project, :shellsafe
                    project = request[:project]
                    reply.data = %x[puppi init #{project}].chomp
#                    reply.exitcode = $?.exitstatus
            end

        end
    end
end
# vi:tabstop=4:expandtab:ai
