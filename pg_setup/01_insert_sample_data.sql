-- =============================================================
-- Sample data for customer, customer_address, orders
-- Requires: pgcrypto (for gen_random_uuid) or Postgres 13+
-- =============================================================

DO $$
DECLARE
  -- customer IDs
  alice_id   UUID := gen_random_uuid();
  bob_id     UUID := gen_random_uuid();
  carol_id   UUID := gen_random_uuid();

  -- address IDs
  alice_addr1_id UUID := gen_random_uuid();
  alice_addr2_id UUID := gen_random_uuid();
  bob_addr_id    UUID := gen_random_uuid();
  carol_addr_id  UUID := gen_random_uuid();

BEGIN

  -- -------------------------------------------------------
  -- customers
  -- -------------------------------------------------------
  INSERT INTO customer (customer_id, email, full_name, phone, status, created_at, updated_at)
  VALUES
    (alice_id, 'alice@example.com', 'Alice Johnson', '+1-555-0101', 'active',   now() - INTERVAL '10 days', now()  - INTERVAL '8 days'),
    (bob_id,   'bob@example.com',   'Bob Martinez',  '+1-555-0202', 'active',   now() - INTERVAL '1 days', now() - INTERVAL '1 days'),
    (carol_id, 'carol@example.com', 'Carol Kim',     NULL,          'inactive', now(), now());

  -- -------------------------------------------------------
  -- addresses
  -- -------------------------------------------------------
  INSERT INTO customer_address (address_id, customer_id, line1, city, state, country, is_default, created_at, updated_at)
  VALUES
    (alice_addr1_id, alice_id, '123 Maple St',    'Austin',   'TX', 'US', TRUE,  now() - INTERVAL '8 days', now() - INTERVAL '8 days'),
    (alice_addr2_id, alice_id, '456 Oak Ave',     'Dallas',   'TX', 'US', FALSE, now() - INTERVAL '9 days' , now() - INTERVAL '9 days'),
    (bob_addr_id,    bob_id,   '789 Pine Rd',     'Portland', 'OR', 'US', TRUE,  now() - INTERVAL '1 days', now()  - INTERVAL '1 days'),
    (carol_addr_id,  carol_id, '321 Birch Blvd',  'Seattle',  'WA', 'US', TRUE,  now(), now());

  -- -------------------------------------------------------
  -- orders
  -- -------------------------------------------------------
  INSERT INTO orders (order_id, customer_id, shipping_addr_id, billing_addr_id, status, total_amount, placed_at, created_at, updated_at)
  VALUES
    (gen_random_uuid(), alice_id, alice_addr1_id, alice_addr1_id, 'delivered', 129.99, now() - INTERVAL '3 days', now(), now()),
    (gen_random_uuid(), alice_id, alice_addr2_id, alice_addr1_id, 'processing', 54.00, now() - INTERVAL '3 days',  now(), now()),
    (gen_random_uuid(), bob_id,   bob_addr_id,    bob_addr_id,   'shipped',   249.50, now() - INTERVAL '1 days',  now(), now()),
    (gen_random_uuid(), carol_id, carol_addr_id,  carol_addr_id, 'pending',    75.00, now() - INTERVAL '1 hour',  now(), now());

END $$;
