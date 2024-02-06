import sys
import yaml


def diff_bools(boolA: bool, boolB: bool) -> int:
    if boolA == boolB:
        print(f"Duplicate bool value found: {boolA}")
        return 1
    return 0


def diff_floats(floatA: float, floatB: float) -> int:
    if floatA == floatB:
        print(f"Duplicate float value found: {floatA}")
        return 1
    return 0


def diff_ints(intA: int, intB: str) -> int:
    if intA == intB:
        print(f"Duplicate int value found: {intA}")
        return 1
    return 0


def diff_strings(stringA: str, stringB: str) -> int:
    if stringA == stringB:
        print(f"Duplicate string value found: {stringA}")
        return 1
    return 0


def diff_lists(listA: list, listB: list) -> int:
    errors = 0
    for item in range(len(listA)):
        # this logic might be problematic
        #
        # we cannot check with "if listA[item] in listB"
        # as this would not allow us to compare nested
        # elements in detail. therefore this logic is
        # not clean enough, especially on divergent
        # lists with both different list values.
        # to mitigate this, we do forward and backward
        # comparison
        if item >= len(listB):
            # listB is shorter, so we can add an error and continue
            continue

        if type(listA[item]) is bool:
            errors += diff_bools(listA[item], listB[item])
        elif type(listA[item]) is int:
            errors += diff_ints(listA[item], listB[item])
        elif type(listA[item]) is float:
            errors += diff_floats(listA[item], listB[item])
        elif type(listA[item]) is str:
            errors += diff_strings(listA[item], listB[item])
        elif type(listA[item]) is list:
            if len(listA[item]) == 0:
                if len(listB[item]) == 0:
                    print(f"Found identical empty lists: {item}")
                    errors += 1
            else:
                errors += diff_lists(sorted(listA[item]), sorted(listB[item]))
        elif type(listA[item]) is dict:
            # check if dicts are empty
            if len(listA[item].items()) == 0:
                if len(listA[item].items()) == 0:
                    print(f"Found identical empty dicts: {item}")
                    errors += 1
            errors += diff_dicts(listA[item], listB[item])

    return errors


def diff_dicts(dictA: dict, dictB: dict) -> int:
    errors = 0
    # first check if the items of dictA are also available in dictB
    for item in dictA:
        # if item is found
        if item in dictB:
            # check if they are the same type
            if type(dictA[item]) is not type(dictB[item]):
                print(f"Found different data type: {item}")
                errors += 1

            if type(dictA[item]) is bool:
                errors += diff_bools(dictA[item], dictB[item])
            elif type(dictA[item]) is int:
                errors += diff_ints(dictA[item], dictB[item])
            elif type(dictA[item]) is float:
                errors += diff_floats(dictA[item], dictB[item])
            elif type(dictA[item]) is str:
                errors += diff_strings(dictA[item], dictB[item])
            elif type(dictA[item]) is list:
                if len(dictA[item]) == 0:
                    if len(dictB[item]) == 0:
                        print(f"Found identical empty lists: {item}")
                        errors += 1
                else:
                    errors += diff_lists(
                        sorted(dictA[item]), sorted(dictB[item])
                    )
            elif type(dictA[item]) is dict:
                # check if dicts are empty
                if len(dictA[item].items()) == 0:
                    if len(dictB[item].items()) == 0:
                        print(f"Found identical empty dicts: {item}")
                        errors += 1
                else:
                    errors += diff_dicts(dictA[item], dictB[item])

    return errors


def main() -> None:
    if len(sys.argv) != 3:
        print("You need to pass two files as arguments!")
        exit(1)

    with open(sys.argv[1], "r") as stream:
        obj1 = yaml.safe_load(stream=stream)

    with open(sys.argv[2], "r") as stream:
        obj2 = yaml.safe_load(stream=stream)

    if type(obj1) is not type(obj2):
        print("Input files do not have the same yaml starting type")
        print("e.g. one file is a dict, the other a list")
        exit(1)

    errors = 0
    if type(obj1) is dict:
        errors += diff_dicts(obj1, obj2)
        errors += diff_dicts(obj2, obj1)
    elif type(obj1) is list:
        errors += diff_lists(obj1, obj2)
        errors += diff_lists(obj2, obj1)
    exit(errors)


main()
