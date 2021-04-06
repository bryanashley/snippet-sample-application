Rails.application.config.middleware.use OmniAuth::Builder do
    provider :square, ENV['SQUARE_APPLICATION_ID'], ENV['SQUARE_ACCESS_TOKEN'],
    {
        :connect_site  => 'https://connect.squareup.com',
        :scope => 'ONLINE_STORE_SITE_READ ONLINE_STORE_SNIPPETS_READ ONLINE_STORE_SNIPPETS_WRITE MERCHANT_PROFILE_READ EMPLOYEES_READ'
    }
end
