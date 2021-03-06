require 'mechanize'
require 'certified'

module Cupertino
  module ProvisioningPortal
    class UnsuccessfulAuthenticationError < RuntimeError; end

    class Device < Struct.new(:name, :udid)
      def to_s
        "#{self.name} #{self.udid}"
      end
    end

    class Certificate < Struct.new(:name, :type, :provisioning_profiles, :expiration_date, :status)
      def to_s
        "#{self.name}"
      end
    end

    class AppID < Struct.new(:bundle_seed_id, :description, :development_properties, :distribution_properties)
      def to_s
        "#{self.bundle_seed_id}"
      end
    end

    class ProvisioningProfile < Struct.new(:name, :type, :app_id, :status)
      def to_s
        "#{self.name}"
      end
    end
    
    class PassTypeID < Struct.new(:description, :id, :pass_certificates, :card_id)
      def to_s
        "#{self.id} #{self.description}"
      end
    end
    
    class PassCertificate < Struct.new(:name, :status, :expiration_date, :certificate_id)
      def to_s
        "#{self.certificate_id}"
      end
    end
  end
end

require 'cupertino/provisioning_portal/helpers'
require 'cupertino/provisioning_portal/agent'
require 'cupertino/provisioning_portal/commands'
