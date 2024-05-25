describe('Add to cart', () => {

  it('clicks on add to cart', () => {
    cy.visit('/')
    cy.get('article button[type="submit"]').first().click();
    cy.get('li.nav-item.end-0').should('contain.text', '(1)');
  });

})
