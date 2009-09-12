# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mytest_session',
  :secret      => '1b9ae79f9173acc19b159a1b9389fbcdde7506a932e171582adfc5d824a4fb074ff08190ae60f705ca1b3274af731b0f0df1b8fa5eadd0598d5c81f83f0629bb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
