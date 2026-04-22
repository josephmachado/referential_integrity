
CREATE TABLE customer (
        customer_id   UUID        PRIMARY KEY,
        email         VARCHAR     NOT NULL UNIQUE,
        full_name     VARCHAR     NOT NULL,
        phone         VARCHAR,
        status        VARCHAR     NOT NULL DEFAULT 'active',
        created_at    TIMESTAMPTZ NOT NULL,
        updated_at    TIMESTAMPTZ NOT NULL
    );


CREATE TABLE customer_address (
      address_id    UUID        PRIMARY KEY,
      customer_id   UUID        NOT NULL REFERENCES customer(customer_id),
      line1         VARCHAR     NOT NULL,
      city          VARCHAR     NOT NULL,
      state         VARCHAR,
      country       CHAR(2)     NOT NULL,
      is_default    BOOLEAN     NOT NULL DEFAULT FALSE,
      created_at    TIMESTAMPTZ NOT NULL,
      updated_at    TIMESTAMPTZ NOT NULL
  );

CREATE TABLE orders (
      order_id           UUID          PRIMARY KEY,
      customer_id        UUID          NOT NULL REFERENCES customer(customer_id),
      shipping_addr_id   UUID          NOT NULL REFERENCES customer_address(address_id),
      billing_addr_id    UUID          NOT NULL REFERENCES customer_address(address_id),
      status             VARCHAR       NOT NULL,
      total_amount       NUMERIC(14,2) NOT NULL,
      placed_at          TIMESTAMPTZ   NOT NULL,
      created_at         TIMESTAMPTZ   NOT NULL,
      updated_at         TIMESTAMPTZ   NOT NULL
  )
