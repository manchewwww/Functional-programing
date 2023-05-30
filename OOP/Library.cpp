#include "Library.h"
#include <iostream>
#pragma warning(disable:4996)

void Library::addPrintEdition(const Base* other, const int count)
{
	for (size_t i = 0; i < sizeOfLibrary; i++) {
		if (other->getLibraryNumber() == library[i]->getLibraryNumber()) {
			throw std::invalid_argument("Print edition with this library number exist.");
			return;
		}
	}
	if (sizeOfLibrary == capacityOfLibrary) {
		resizeLibrary();
		resizeBooks();
	}
	library[sizeOfLibrary] = other->clone();
	countOfBooks[sizeOfLibrary++] = count;
	std::cout << "Add print edition is successfully.\n";
}
void Library::removePrintEdition(const int libraryNumber)
{
	for (size_t i = 0; i < sizeOfLibrary; i++) {
		if (libraryNumber == library[i]->getLibraryNumber()) {
			std::swap(library[i], library[--sizeOfLibrary]);
			std::swap(countOfBooks[i], countOfBooks[sizeOfLibrary]);
			for (size_t i = 0; i < sizeOfUsers; i++) {
				users[i] -= libraryNumber;
			}
			std::cout << "Removed print edition is successfully.\n";
			return;
		}
	}
	throw std::invalid_argument("Book with this library number does not exist.");
}
void Library::print()
{
	sortLibrary();
	for (size_t i = 0; i < sizeOfLibrary; i++) {
		library[i]->print();
	}
	std::cout << "Print is completed.\n";
}
void Library::addUser(const char* name)
{
	for (unsigned i = 0; i < sizeOfUsers; i++) {
		if (strcmp(name, users[i].getName()) == 0) {
			throw std::invalid_argument("User with this name exist.");
		}
	}
	if (sizeOfUsers == capacityOfUsers) {
		resizeUsers();
	}
	users[sizeOfUsers++] = User(name);
}
void Library::addUser(const User& other)
{
	for (unsigned i = 0; i < sizeOfUsers; i++) {
		if (users[i] == other) {
			throw std::invalid_argument("User with this name exist.\n");
		}
	}
	if (sizeOfUsers == capacityOfUsers) {
		resizeUsers();
	}
	users[sizeOfUsers++] = other;
	std::cout << "Add user is successfully.\n";
}
void Library::removeUser(const char* name)
{
	for (unsigned i = 0; i < sizeOfUsers; i++) {
		if (strcmp(name, users[i].getName()) == 0) {
			std::swap(users[i], users[--sizeOfUsers]);
			std::cout << "Remove user is successefully!";
			return;
		}
	}
	throw std::invalid_argument("User with this name does not exist.\n");

}
void Library::printOverduePrintEdition() const
{
	std::cout << "We don't have overdue print edition." << std::endl;
}
void Library::printUsersWhichHaveTakenBookWithLibraryNumber(const int libraryNumber) const
{
	for (size_t i = 0; i < sizeOfUsers; i++) {
		if (users[i][libraryNumber] == 0) {
			std::cout << "Name: " << users[i].getName() << "\n";
		}
	}
}
void Library::printUsers()
{
	sortUsers();
	for (size_t i = 0; i < sizeOfUsers; i++) {
		std::cout << "Name: " << users[i].getName() << "; Read book: " << users[i].getCountOfReadBooks() << std::endl;
	}
}
void Library::borrowingPrintEdition(const char* name, const unsigned libraryNumber)
{
	for (unsigned i = 0; i < sizeOfUsers; i++) {
		if (strcmp(name, users[i].getName()) == 0) {
			for (size_t j = 0; j < sizeOfLibrary; j++) {
				if (libraryNumber == library[j]->getLibraryNumber()) {
					if (countOfBooks[j] > 0) {
						users[i] += library[j];
						countOfBooks[j] -= 1;
						return;
					}
					else {
						throw std::invalid_argument("Book with this library number is not available");
					}
				}
			}
			throw std::invalid_argument("Book with this library number does not exist.");
		}
	}
	throw std::invalid_argument("User with this username does not exist.");
}
void Library::returnPrintEdition(const char* name, const unsigned libraryNumber)
{
	for (unsigned i = 0; i < sizeOfUsers; i++) {
		if (strcmp(name, users[i].getName()) == 0) {
			for (size_t j = 0; j < sizeOfLibrary; j++) {
				if (libraryNumber == library[j]->getLibraryNumber()) {
					users[i] -= library[j];
					countOfBooks[j]++;
					return;
				}
			}
			users[i] -= libraryNumber;
			throw std::invalid_argument("Period edition with this library number is not available in library.");
		}
	}

	throw std::invalid_argument("User with this username does not exist.");
}

Library::Library() : sizeOfLibrary(0), capacityOfLibrary(8), sizeOfUsers(0), capacityOfUsers(8)
{
	library = new Base * [capacityOfLibrary];
	countOfBooks = new int[capacityOfLibrary];
	users = new User[capacityOfUsers];
}
Library::Library(const Base** library, const int* countOfBooks, const unsigned sizeOfLibrary, const User* users, const unsigned sizeOfUsers) :
	sizeOfLibrary(sizeOfLibrary), capacityOfLibrary(sizeOfLibrary * 2), sizeOfUsers(sizeOfUsers), capacityOfUsers(sizeOfUsers * 2)
{
	try
	{
		setLibrary(library);
		setCountOfBooks(countOfBooks);
		setUsers(users);
	}
	catch (const std::invalid_argument& e)
	{
		std::cout << e.what() << std::endl;
		if (this->library != nullptr) {
			delete[] this->library;
		}
		if (this->countOfBooks != nullptr) {
			delete[] this->countOfBooks;
		}
	}

}
Library::Library(const Library& other)
{
	copyFrom(other);
}
Library& Library::operator=(const Library& other)
{
	if (this != &other) {
		free();
		copyFrom(other);
	}
	return *this;
}
Library::~Library()
{
	free();
}

Base** Library::getLibrary() const
{
	return library;
}
int* Library::getCountOfBooks() const
{
	return countOfBooks;
}
unsigned Library::getSizeOfLibrary() const
{
	return sizeOfLibrary;
}
User* Library::getUsers() const
{
	return users;
}
unsigned Library::getSizeOfUsers() const
{
	return sizeOfUsers;
}

void Library::resizeLibrary()
{
	Base** newCollection = new Base * [capacityOfLibrary *= 2];
	for (unsigned i = 0; i < sizeOfLibrary; i++) {
		newCollection[i] = library[i]->clone();
	}
	for (unsigned i = 0; i < sizeOfLibrary; i++) {
		delete library[i];
	}
	delete[] library;
	library = newCollection;
}
void Library::resizeBooks()
{
	int* temp = new int[capacityOfLibrary];
	for (unsigned i = 0; i < sizeOfLibrary; i++) {
		temp[i] = countOfBooks[i];
	}
	delete[] countOfBooks;
	countOfBooks = temp;
}
void Library::resizeUsers()
{
	User* temp = new User[capacityOfUsers *= 2];
	for (unsigned i = 0; i < sizeOfUsers; i++) {
		temp[i] = users[i];
	}
	delete[] users;
	users = temp;
}
void Library::sortLibrary()
{
	unsigned max = 0;
	for (unsigned i = 0; i < sizeOfLibrary; i++) {
		max = i;
		for (unsigned j = i + 1; j < sizeOfLibrary; j++) {
			if (library[max]->getYear() < library[j]->getYear()) {
				max = j;
			}
		}
		if (max != i) {
			std::swap(library[i], library[max]);
			std::swap(countOfBooks[i], countOfBooks[max]);
		}
	}
	for (size_t i = 0; i < sizeOfLibrary - 1; i++) {
		if (library[i]->getYear() == library[i + 1]->getYear()) {
			if (strcmp(library[i]->getTitle(), library[i + 1]->getTitle()) == 1) {
				std::swap(library[i], library[i + 1]);
				std::swap(countOfBooks[i], countOfBooks[i + 1]);
				i = 0;
			}
		}
	}


}
void Library::sortUsers()
{
	unsigned max = 0;
	for (size_t i = 0; i < sizeOfUsers; i++) {
		max = i;
		for (size_t j = i + 1; j < sizeOfUsers; j++) {
			if (users[max] < users[j]) {
				max = j;
			}
		}
		if (max != i) {
			std::swap(users[i], users[max]);
		}
	}
}

void Library::copyFrom(const Library& other)
{
	capacityOfLibrary = other.capacityOfLibrary;
	sizeOfLibrary = other.sizeOfLibrary;
	capacityOfUsers = other.capacityOfUsers;
	sizeOfUsers = other.sizeOfUsers;
	try
	{
		setLibrary(other.library);
		setCountOfBooks(other.countOfBooks);
		setUsers(other.users);
	}
	catch (const std::invalid_argument& e)
	{
		std::cout << e.what() << std::endl;
		if (this->library != nullptr) {
			delete[] this->library;
		}
		if (this->countOfBooks != nullptr) {
			delete[] this->countOfBooks;
		}
	}
}
void Library::free()
{
	for (unsigned i = 0; i < sizeOfLibrary; i++) {
		delete library[i];
	}
	delete[] library;
	delete[] countOfBooks;
	delete[] users;
	library = nullptr;
	countOfBooks = nullptr;
	users = nullptr;
	sizeOfLibrary = 0;
	sizeOfUsers = 0;
	capacityOfLibrary = 0;
	capacityOfUsers = 0;
}
void Library::setLibrary(const Base* const* library)
{
	if (library == nullptr)
		throw std::invalid_argument("Library books must be diferent from nullptr");
	this->library = new Base * [capacityOfLibrary];
	for (size_t i = 0; i < sizeOfLibrary; i++) {
		this->library[i] = library[i]->clone();
	}
}
void Library::setCountOfBooks(const int* countOfBooks)
{
	if (countOfBooks == nullptr)
		throw std::invalid_argument("Count of books must be diferent from nullptr");
	this->countOfBooks = new int[capacityOfLibrary];
	for (size_t i = 0; i < sizeOfUsers; i++) {
		this->countOfBooks[i] = countOfBooks[i];
	}
}
void Library::setUsers(const User* users)
{
	if (users == nullptr)
		throw std::invalid_argument("Users must be diferent from nullptr");
	this->users = new User[capacityOfUsers];
	for (size_t i = 0; i < sizeOfUsers; i++) {
		this->users[i] = users[i];
	}
}
