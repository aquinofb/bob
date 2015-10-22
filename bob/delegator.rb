module Bob
  module Delegator
    def self.delegate(*methods, opts)
      Array(methods).each do |method_name|
        define_method(method_name) do |*args, &block|
          opts[:to].send(method_name, *args, &block)
        end

        private method_name
      end
    end

    delegate :get, :patch, :put, :post, :delete, :head, to: Application
  end
end
