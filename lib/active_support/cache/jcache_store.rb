require 'activesupport'

module ActiveSupport
  module Cache
    class JcacheStore < Store
      VERSION = '0.1.0'
      include_class "java.util.Collections"
      include_class "javax.cache.CacheException"
      include_class "javax.cache.CacheManager"
      
      class JcacheError < StandardError; end 
      
      def initialize(options = {})
        cacheFactory = CacheManager.get_instance.get_cache_factory;
        @data = cacheFactory.create_cache(Collections.empty_map);
      end

      def read(key, options = nil)
        super
        @data.get(key)
      rescue CacheException => e
        logger.error("JcacheError (#{e}): #{e.message}")
        false
      end

      def write(key, value, options = {})
        super
        @data.put(key, value)
        true
      rescue CacheException => e
        logger.error("JcacheError (#{e}): #{e.message}")
        false
      end

      def delete(key, options = nil)
        super
        @data.remove(key)
      rescue CacheException => e
        logger.error("JcacheError (#{e}): #{e.message}")
        false
      end

      def keys
        @data.key_set.to_a
      end

      def exist?(key, options = nil)
        @data.contains_key(key)
      end

      def delete_matched(matcher, options = nil)
        super
        raise "Not supported by Ehcache"
      end

      def clear
        @data.clear
        true
      rescue CacheException => e
        logger.error("JcacheError (#{e}): #{e.message}")
        false
      end
    end
  end
end
