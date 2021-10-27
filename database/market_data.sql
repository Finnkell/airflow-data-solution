CREATE DATABASE market_data;
USE market_data;
DROP TABLE IF EXISTS ticker;
CREATE TABLE ticker (
  `ticker_id` VARCHAR(10) UNIQUE,
  `ticker_name` VARCHAR(255) DEFAULT NULL,
  `ticker_sector` VARCHAR(255) DEFAULT NULL,
  `ticker_sub_sector` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (ticker_id)
);
DROP TABLE IF EXISTS ohlc_data;
CREATE TABLE ohlc_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `open_price` DOUBLE DEFAULT 0.0,
  `high_price` DOUBLE DEFAULT 0.0,
  `low_price` DOUBLE DEFAULT 0.0,
  `close_price` DOUBLE DEFAULT 0.0,
  `volume_price` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS tick_by_tick_data;
CREATE TABLE tick_by_tick_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `bid` DOUBLE DEFAULT 0.0,
  `ask` DOUBLE DEFAULT 0.0,
  `last` DOUBLE DEFAULT 0.0,
  `volume` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS valuation_data;
CREATE TABLE valuation_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `dy` DOUBLE DEFAULT 0.0,
  `p/l` DOUBLE DEFAULT 0.0,
  `peg_ratio` DOUBLE DEFAULT 0.0,
  `p/vp` DOUBLE DEFAULT 0.0,
  `ev/ebitda` DOUBLE DEFAULT 0.0,
  `ev/ebit` DOUBLE DEFAULT 0.0,
  `p/ebitda` DOUBLE DEFAULT 0.0,
  `p/ebit` DOUBLE DEFAULT 0.0,
  `vpa` DOUBLE DEFAULT 0.0,
  `p/ativo` DOUBLE DEFAULT 0.0,
  `lpa` DOUBLE DEFAULT 0.0,
  `p/sr` DOUBLE DEFAULT 0.0,
  `p/capital_giro` DOUBLE DEFAULT 0.0,
  `p/ativo_circulante_liq` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS endividamento_data;
CREATE TABLE endividamento_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `divida_liquida/pl` DOUBLE DEFAULT 0.0,
  `divida_liquida/ebitda` DOUBLE DEFAULT 0.0,
  `divida_liquida/ebit` DOUBLE DEFAULT 0.0,
  `pl/ativos` DOUBLE DEFAULT 0.0,
  `passivos/ativos` DOUBLE DEFAULT 0.0,
  `liquidez_corrente` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS eficiencia_data;
CREATE TABLE eficiencia_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `margem_bruta` DOUBLE DEFAULT 0.0,
  `margem_ebitda` DOUBLE DEFAULT 0.0,
  `margem_ebit` DOUBLE DEFAULT 0.0,
  `margem_liquida` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS rentabilidade_data;
CREATE TABLE rentabilidade_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `roe` DOUBLE DEFAULT 0.0,
  `roa` DOUBLE DEFAULT 0.0,
  `roic` DOUBLE DEFAULT 0.0,
  `giro_ativos` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS crescimento_data;
CREATE TABLE crescimento_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `cagr_receitas` DOUBLE DEFAULT 0.0,
  `cagr_lucros` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS resultados_data;
CREATE TABLE resultados_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `receita_liquida` DOUBLE DEFAULT 0.0,
  `custos` DOUBLE DEFAULT 0.0,
  `lucro_bruto` DOUBLE DEFAULT 0.0,
  `despesas/receitas_operacionais` DOUBLE DEFAULT 0.0,
  `ebitda` DOUBLE DEFAULT 0.0,
  `amortizacao/depreciacao` DOUBLE DEFAULT 0.0,
  `ebit` DOUBLE DEFAULT 0.0,
  `resultado_nao_operacional` DOUBLE DEFAULT 0.0,
  `resultado_financeiro` DOUBLE DEFAULT 0.0,
  `impostos` DOUBLE DEFAULT 0.0,
  `lucro_liquido` DOUBLE DEFAULT 0.0,
  `lucro_atribuido_a_controladora` DOUBLE DEFAULT 0.0,
  `lucro_atribuido_a_nao_controladores` DOUBLE DEFAULT 0.0,
  `capex` DOUBLE DEFAULT 0.0,
  `divida_bruta` DOUBLE DEFAULT 0.0,
  `divida_liquida` DOUBLE DEFAULT 0.0,
  `roe` DOUBLE DEFAULT 0.0,
  `roic` DOUBLE DEFAULT 0.0,
  `margem_bruta` DOUBLE DEFAULT 0.0,
  `margem_ebitda` DOUBLE DEFAULT 0.0,
  `margem_liquida` DOUBLE DEFAULT 0.0,
  `divida_liquida/ebitda` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS fluxo_de_caixa_data;
CREATE TABLE fluxo_de_caixa_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `caixa_liquido_atividades_operacionais` DOUBLE DEFAULT 0.0,
  `caixa_gerado_nas_operacoes` DOUBLE DEFAULT 0.0,
  `lucro_liquido` DOUBLE DEFAULT 0.0,
  `equivalencia_patrimonial` DOUBLE DEFAULT 0.0,
  `depreciacao_e_amortizacao` DOUBLE DEFAULT 0.0,
  `variacoes_nos_ativos_e_passivos` DOUBLE DEFAULT 0.0,
  `caixa_liquido_atividades_de_investimento` DOUBLE DEFAULT 0.0,
  `fluxo_de_caixa_livre` DOUBLE DEFAULT 0.0,
  `caixa_liquido_atividades_de_financiamento` DOUBLE DEFAULT 0.0,
  `variacao_cambil_de_caixa_e_equivalentes` DOUBLE DEFAULT 0.0,
  `aumento_de_caixa_e_equivalentes` DOUBLE DEFAULT 0.0,
  `saldo_inicial_de_caixa_e_equivalentes` DOUBLE DEFAULT 0.0,
  `saldo_final_de_caixa_e_equivalentes` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);
DROP TABLE IF EXISTS balanco_patrimonial_data;
CREATE TABLE balanco_patrimonial_data (
  `ticker_id` VARCHAR(10) UNIQUE,
  `ativo_total` DOUBLE DEFAULT 0.0,
  `ativo_circulante` DOUBLE DEFAULT 0.0,
  `aplicacoes_financeiras` DOUBLE DEFAULT 0.0,
  `caixa_e_equivalentes_de_caixa` DOUBLE DEFAULT 0.0,
  `contas_a_receber` DOUBLE DEFAULT 0.0,
  `estoque` DOUBLE DEFAULT 0.0,
  `ativo_nao_circulante` DOUBLE DEFAULT 0.0,
  `ativo_realizavel_a_longo_prazo` DOUBLE DEFAULT 0.0,
  `investimentos` DOUBLE DEFAULT 0.0,
  `imobilizado` DOUBLE DEFAULT 0.0,
  `intangivel` DOUBLE DEFAULT 0.0,
  `passivo_total` DOUBLE DEFAULT 0.0,
  `passivo_circulante` DOUBLE DEFAULT 0.0,
  `passivo_nao_circulante` DOUBLE DEFAULT 0.0,
  `patrimoio_liquido_consolidado` DOUBLE DEFAULT 0.0,
  `capital_social_realizado` DOUBLE DEFAULT 0.0,
  `reserva_capital` DOUBLE DEFAULT 0.0,
  `reserva_lucros` DOUBLE DEFAULT 0.0,
  `participacao_dos_nao_controladores` DOUBLE DEFAULT 0.0,
  FOREIGN KEY (ticker_id) REFERENCES ticker(ticker_id)
);