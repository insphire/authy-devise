module DeviseAuthy
  module Views
    module Helpers

      def authy_request_sms_link
        link_to(
          I18n.t('request_sms', {:scope => 'devise'}),
          url_for([resource_name, :request_sms]),
          :id => "authy-request-sms-link",
          :method => :post,
          :remote => true
        )
      end

      def verify_authy_form(options={:class => 'authy-form'}, &block)
        form_tag([resource_name, :verify_authy], {:id => 'devise_authy', :method => :post, :class => options[:class]}) do
          buffer = hidden_field_tag(:"#{resource_name}_id", @resource.id)
          buffer << capture(&block)
        end
      end

      def enable_authy_form(options={:class => 'authy-form'}, &block)
        form_tag([resource_name, :enable_authy], :method => :post, :class => options[:class]) do
          capture(&block)
        end
      end

      def verify_authy_installation_form(options={:class => 'authy-form'}, &block)
        form_tag([resource_name, :verify_authy_installation], :method => :post, :class => options[:class]) do
          capture(&block)
        end
      end
    end
  end
end

