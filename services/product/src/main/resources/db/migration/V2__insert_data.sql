-- Insert categories for books and novels
INSERT INTO category (id, description, name)
VALUES
    (nextval('category_seq'), 'Fictional novels', 'Novels'),
    (nextval('category_seq'), 'Self-help and development books', 'Self-Development'),
    (nextval('category_seq'), 'Romantic novels', 'Romance'),
    (nextval('category_seq'), 'Historical novels', 'History'),
    (nextval('category_seq'), 'Fantasy novels', 'Fantasy');

-- Insert products (books) for the 'Novels' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 50, 'A novel by George Orwell exploring the dangers of totalitarianism.', '1984', 9.99, (SELECT id FROM category WHERE name = 'Novels')),
    (nextval('product_seq'), 30, 'A classic novel by F. Scott Fitzgerald about the American Dream.', 'The Great Gatsby', 8.99, (SELECT id FROM category WHERE name = 'Novels')),
    (nextval('product_seq'), 40, 'A novel by Harper Lee exploring racial injustice in the American South.', 'To Kill a Mockingbird', 7.99, (SELECT id FROM category WHERE name = 'Novels')),
    (nextval('product_seq'), 25, 'A historical novel by Leo Tolstoy about the French invasion of Russia.', 'War and Peace', 14.99, (SELECT id FROM category WHERE name = 'Novels')),
    (nextval('product_seq'), 35, 'A novel by J.D. Salinger about teenage angst and alienation.', 'The Catcher in the Rye', 10.99, (SELECT id FROM category WHERE name = 'Novels'));

-- Insert products (books) for the 'Self-Development' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 45, 'A book by Dale Carnegie on how to influence and win people over.', 'How to Win Friends and Influence People', 12.99, (SELECT id FROM category WHERE name = 'Self-Development')),
    (nextval('product_seq'), 40, 'A book by Stephen R. Covey on developing effective habits for success.', 'The 7 Habits of Highly Effective People', 11.99, (SELECT id FROM category WHERE name = 'Self-Development')),
    (nextval('product_seq'), 50, 'A book by James Clear on the power of small habits in achieving big results.', 'Atomic Habits', 13.99, (SELECT id FROM category WHERE name = 'Self-Development')),
    (nextval('product_seq'), 35, 'A book by Mark Manson that challenges traditional self-help advice.', 'The Subtle Art of Not Giving a F*ck', 10.99, (SELECT id FROM category WHERE name = 'Self-Development')),
    (nextval('product_seq'), 30, 'A book by Brené Brown on the importance of vulnerability in personal growth.', 'Daring Greatly', 14.99, (SELECT id FROM category WHERE name = 'Self-Development'));

-- Insert products (books) for the 'Romance' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 60, 'A classic romantic novel by Jane Austen.', 'Pride and Prejudice', 9.99, (SELECT id FROM category WHERE name = 'Romance')),
    (nextval('product_seq'), 45, 'A novel by Nicholas Sparks about enduring love.', 'The Notebook', 7.99, (SELECT id FROM category WHERE name = 'Romance')),
    (nextval('product_seq'), 50, 'A romantic novel by Emily Brontë set on the Yorkshire moors.', 'Wuthering Heights', 8.99, (SELECT id FROM category WHERE name = 'Romance')),
    (nextval('product_seq'), 55, 'A novel by Audrey Niffenegger about a love that transcends time.', 'The Time Traveler’s Wife', 12.99, (SELECT id FROM category WHERE name = 'Romance')),
    (nextval('product_seq'), 40, 'A romantic novel by Margaret Mitchell set during the American Civil War.', 'Gone with the Wind', 15.99, (SELECT id FROM category WHERE name = 'Romance'));

-- Insert products (books) for the 'History' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 20, 'A novel by Ken Follett about the construction of a cathedral in medieval England.', 'The Pillars of the Earth', 16.99, (SELECT id FROM category WHERE name = 'History')),
    (nextval('product_seq'), 35, 'A historical novel by Hilary Mantel about Thomas Cromwell.', 'Wolf Hall', 14.99, (SELECT id FROM category WHERE name = 'History')),
    (nextval('product_seq'), 25, 'A novel by Umberto Eco about a murder mystery in a medieval monastery.', 'The Name of the Rose', 13.99, (SELECT id FROM category WHERE name = 'History')),
    (nextval('product_seq'), 30, 'A novel by Robert Harris about ancient Rome.', 'Pompeii', 11.99, (SELECT id FROM category WHERE name = 'History')),
    (nextval('product_seq'), 15, 'A historical novel by Michael Shaara about the Battle of Gettysburg.', 'The Killer Angels', 10.99, (SELECT id FROM category WHERE name = 'History'));

-- Insert products (books) for the 'Fantasy' category
INSERT INTO public.product (id, available_quantity, description, name, price, category_id)
VALUES
    (nextval('product_seq'), 100, 'A fantasy novel by J.R.R. Tolkien about the journey of Frodo Baggins.', 'The Lord of the Rings: The Fellowship of the Ring', 12.99, (SELECT id FROM category WHERE name = 'Fantasy')),
    (nextval('product_seq'), 95, 'A novel by J.K. Rowling about the wizarding world.', 'Harry Potter and the Sorcerer’s Stone', 9.99, (SELECT id FROM category WHERE name = 'Fantasy')),
    (nextval('product_seq'), 80, 'A novel by George R.R. Martin about the battle for the Iron Throne.', 'A Game of Thrones', 10.99, (SELECT id FROM category WHERE name = 'Fantasy')),
    (nextval('product_seq'), 70, 'A novel by Philip Pullman about a young girl’s journey to parallel worlds.', 'The Golden Compass', 8.99, (SELECT id FROM category WHERE name = 'Fantasy')),
    (nextval('product_seq'), 85, 'A novel by Patrick Rothfuss about the journey of Kvothe.', 'The Name of the Wind', 11.99, (SELECT id FROM category WHERE name = 'Fantasy'));
