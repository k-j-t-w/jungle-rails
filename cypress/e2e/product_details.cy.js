describe('_product', () => {
  beforeEach(() => {

    cy.visit('/')
  })

  it('clicks on a product', () => {
    cy.get('article a').first().click()
  });

})
