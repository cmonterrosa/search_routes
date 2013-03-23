# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_routes_search_session',
  :secret      => '94af9444e94cf111d64ef0b0d5752c7461b201af95661cb9682d9723199da3b64efce251f7ca3f41bdac82ab26dcd18dc11aa6f86d6e687ff70530fb6e317677'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
