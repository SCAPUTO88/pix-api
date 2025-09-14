-- ===========================
-- V1__init.sql
-- Criação das tabelas iniciais
-- ===========================

-- Tabela de contas
CREATE TABLE accounts (
    id UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    document VARCHAR(20) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de cobranças
CREATE TABLE charges (
    id UUID PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES accounts(id) ON DELETE CASCADE,
    amount NUMERIC(15,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    qr_code TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pagamentos
CREATE TABLE payments (
    id UUID PRIMARY KEY,
    charge_id UUID NOT NULL REFERENCES charges(id) ON DELETE CASCADE,
    paid_at TIMESTAMP,
    amount NUMERIC(15,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Índices para performance
CREATE INDEX idx_charges_status ON charges(status);
CREATE INDEX idx_payments_status ON payments(status);