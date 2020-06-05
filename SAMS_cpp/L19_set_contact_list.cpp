#include <set>
#include <string>
#include <iostream> 
using namespace std; 

template <typename T> 
void DisplayContents(const T& container) {
    for (auto element = container.cbegin();
         element != container.cend();
         ++ element) 
    cout << *element << ' ' << endl;
    cout << endl;
}

struct ContactItem {
    string name;
    string phone;
    string displayAs;

    ContactItem (const string& conName, const string& conNum){
        name = conName;
        phone = conNum;
        displayAs = (name + ": " + phone);
    }

    bool operator == (const ContactItem& itemToCompare) const {
        return (itemToCompare.name == this->name);
    }

    bool operator < (const ContactItem& itemToCompare) const {
        return (this->name < itemToCompare.name);
    }

    operator const char*() const {
        return displayAs.c_str();
    }
};


bool SortOnphoneNumber (const ContactItem& item1, const ContactItem& item2) {
    return (item1.phone < item2.phone);
}

int main() {
    set <ContactItem> contacts;
    contacts.insert(ContactItem("Jack Welsch", "+1 7889879879"));
    contacts.insert(ContactItem("Bill Gates", "+1 97 789787998"));
    contacts.insert(ContactItem("Angi Merkel", "+49 234565466"));
    contacts.insert(ContactItem("Vlad Putin", "+7 66454564797"));
    contacts.insert(ContactItem("Ben Affleck", "+1 745641314"));
    contacts.insert(ContactItem("Dan Craig", "+44 123641976"));

    cout << "set in initial order: " << endl;
    DisplayContents(contacts);

    cout << "enter a name you wish to delete: ";
    string inputName;
    getline(cin, inputName);

    //inputName = "Jack Welsch";

    auto contactFound = contacts.find(ContactItem(inputName, ""));
    if (contactFound != contacts.end()) {
        contacts.erase(contactFound);
        cout << "display content after erasing " << inputName << endl; 
        DisplayContents(contacts);
    }
    else 
        cout << "contact not found" << endl;

    return 0;
}